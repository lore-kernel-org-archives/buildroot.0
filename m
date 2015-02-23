From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Feb 2015 19:17:21 +0100
Subject: [Buildroot] [PATCH] gettext: add dependency on host-libxml2 for
 host-gettext.
In-Reply-To: <1424696593-21361-1-git-send-email-nicolas.cavallari@green-communications.fr>
References: <20150220222933.5B92D817C4@busybox.osuosl.org>
 <1424696593-21361-1-git-send-email-nicolas.cavallari@green-communications.fr>
Message-ID: <20150223191721.573fdb19@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Nicolas Cavallari,

On Mon, 23 Feb 2015 14:03:13 +0100, Nicolas Cavallari wrote:
> From: Ignacy Gaw?dzki <ignacy.gawedzki@green-communications.fr>
> 
> Otherwise, the locally-installed libxml2 will be used, which may
> depend on a locally-installed liblzma which may create conflict
> if host-liblzma is compiled.
> 
> Fixes https://bugs.busybox.net/show_bug.cgi?id=7886
> 
> Signed-off-by: Ignacy Gaw?dzki <ignacy.gawedzki@green-communications.fr>
> [nicolas: added extended commit message]
> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> ---
> Ignacy is unavailable this week, but he commited this change to our
> local tree before leaving.
> 
> diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
> index c2419c1..a554517 100644
> --- a/package/gettext/gettext.mk
> +++ b/package/gettext/gettext.mk
> @@ -12,7 +12,7 @@ GETTEXT_LICENSE = GPLv2+
>  GETTEXT_LICENSE_FILES = COPYING
>  
>  GETTEXT_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
> -HOST_GETTEXT_DEPENDENCIES = # we don't want the libiconv dependency
> +HOST_GETTEXT_DEPENDENCIES = host-libxml2 # we don't want the libiconv dependency

I agree that we normally prefer to rely on external libraries, rather
than built-in copies. However, in this case, I am wondering if we
shouldn't rather rely on the built-in copy, which is more lightweight
that building host-libxml2.

From the DEPENDENCIES file of gettext:

* libxml2
  + Optional.
    Needed for the --color option of the various programs.
    If not present, a subset of libxml2 (included in this package) will be
    compiled into libgettextlib.
  + Homepage:
    http://xmlsoft.org/
  + Download:
    ftp://xmlsoft.org/libxml2/
  + If it is installed in a nonstandard directory, pass the option
    --with-libxml2-prefix=DIR to 'configure'.

So instead of building an external libxml2, we can pass
--with-included-libxml to the gettext-tools configure script to force
it to use the built-in libxml2 subset.

Note that there are several other libraries in the same situation:
glib2, libcroco and libunistring.

What is the opinion of other BR developers about this?

And all that just for a --color command line option that we really
don't care about. Why the heck isn't this thing optional in the first place?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
