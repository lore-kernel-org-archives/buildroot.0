From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Jan 2020 17:05:39 +0100
Subject: [Buildroot] [PATCH 1/1] package/fetchmail: bump version to 6.4.1
In-Reply-To: <20190928123818.20134-1-bernd.kuhls@t-online.de>
References: <20190928123818.20134-1-bernd.kuhls@t-online.de>
Message-ID: <20200118160539.GE22540@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2019-09-28 14:38 +0200, Bernd Kuhls spake thusly:
> Added hashes provided by upstream.
> 
> Updated license hash after upstream commit:
> https://sourceforge.net/p/fetchmail/git/ci/51ea9ddcef4b0e513a493f62a4bd93e41ff201ea/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

I accidentally stumbled upon a recent build failure in the autobuilders:

    http://autobuild.buildroot.org/results/d7e/d7e40b093a72cb255cbd09b385695841b9fc403f/

The issue is that the build is not reproducible, notably because the
fetchmail executables embeds host path:

    ?? ./usr/bin/fetchmailconf
    ? @@ -1,2 +1,2 @@
    ?  #! /bin/sh
    ? -exec /home/naourr/work/instance-2/output-1/host/bin/python /usr/lib/python2.7/site-packages/fetchmailconf.py "$@"
    ? +exec /home/naourr/work/instance-2/output-2/host/bin/python /usr/lib/python2.7/site-packages/fetchmailconf.py "$@"

So, fetchmail can't even work, because it is trying to exec the host
python interpreter, using the host path at build time...

Care to have a look at it, please?

Regards,
Yann E. MORIN.

> ---
>  package/fetchmail/fetchmail.hash | 8 ++++++--
>  package/fetchmail/fetchmail.mk   | 2 +-
>  2 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/package/fetchmail/fetchmail.hash b/package/fetchmail/fetchmail.hash
> index e215781d8a..6fea3754f0 100644
> --- a/package/fetchmail/fetchmail.hash
> +++ b/package/fetchmail/fetchmail.hash
> @@ -1,3 +1,7 @@
> +# From https://sourceforge.net/p/fetchmail/mailman/message/36773574/
> +sha1 1aadf078ed8fb1b6c93e9126cc0375b1f740301a  fetchmail-6.4.1.tar.xz
> +sha256 3f33f11dd08c3e8cc3e9d18eec686b1626d4818f4d5a72791507bbc4dce6a9a0  fetchmail-6.4.1.tar.xz
> +sha512 940b8df52f963f71537962ebe2b2cb88298fd2b54ca79932e5c974abe850f0b59cdc4919d606ee4f210e82d1e0a6f090ea87f1d3bdea18b531d4fbb36f7f9ea0  fetchmail-6.4.1.tar.xz
> +
>  # Locally computed:
> -sha256 8b6c7c113b58ca32b3041375bdab4b2e4e6e98c975e1365de5e51f63ef07bf2e  fetchmail-6.4.0.rc1.tar.xz
> -sha256 678189d91119286a3499874421006bb81f49b13eff8e1223115ce1b07e7ed0e7  COPYING
> +sha256 89d6efe79c78f965b256e007d6acc367fff982c59b6195fb6ec5895ea0fc9bd5  COPYING
> diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
> index 1d3918ac90..b8e3c667e3 100644
> --- a/package/fetchmail/fetchmail.mk
> +++ b/package/fetchmail/fetchmail.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  FETCHMAIL_VERSION_MAJOR = 6.4
> -FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).0.rc1
> +FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).1
>  FETCHMAIL_SOURCE = fetchmail-$(FETCHMAIL_VERSION).tar.xz
>  FETCHMAIL_SITE = http://downloads.sourceforge.net/project/fetchmail/branch_$(FETCHMAIL_VERSION_MAJOR)
>  FETCHMAIL_LICENSE = GPL-2.0; some exceptions are mentioned in COPYING
> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
