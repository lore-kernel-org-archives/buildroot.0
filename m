From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Apr 2017 16:10:06 +0200
Subject: [Buildroot] [PATCH 1/1] automake: add patch fixing GNU bug
	#25299
In-Reply-To: <CAEyMn7YddOxBVShv7WvEcMLCL-rJL_CdJp7d0R0NU0=ZYVwrKA@mail.gmail.com>
References: <1491568417-5355-1-git-send-email-heiko.thiery@gmail.com>
 <CAEyMn7YddOxBVShv7WvEcMLCL-rJL_CdJp7d0R0NU0=ZYVwrKA@mail.gmail.com>
Message-ID: <fb021600-fec9-11e8-b7e3-03b660e975b8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10-04-17 07:48, Heiko Thiery wrote:
> 2017-04-07 14:33 GMT+02:00 Heiko Thiery <heiko.thiery@gmail.com
> <mailto:heiko.thiery@gmail.com>>:
> 
>     A bug in automake makes it impossible to build in an output directory
>     that contains an '@' character. But this is needed if you want to build
>     with jenkins' pipeline plugin.
> 
>     This patch was proposed by Michael Brantley but is currently not applied
>     in the upstream automake repository.
> 
>     Refer to: https://debbugs.gnu.org/cgi/bugreport.cgi?bug=25299
>     <https://debbugs.gnu.org/cgi/bugreport.cgi?bug=25299>
> 
>     Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com
>     <mailto:heiko.thiery@gmail.com>>
>     ---
>      ...character-in-installation-prefix-breaks-automake.patch | 15 +++++++++++++++
>      1 file changed, 15 insertions(+)
>      create mode 100644
>     package/automake/0003-at-character-in-installation-prefix-breaks-automake.patch
> 
>     diff --git
>     a/package/automake/0003-at-character-in-installation-prefix-breaks-automake.patch
>     b/package/automake/0003-at-character-in-installation-prefix-breaks-automake.patch
>     new file mode 100644
>     index 0000000..3a5a571
>     --- /dev/null
>     +++
>     b/package/automake/0003-at-character-in-installation-prefix-breaks-automake.patch
>     @@ -0,0 +1,15 @@
>     +See bug report #25299 (https://debbugs.gnu.org/cgi/bugreport.cgi?bug=25299
>     <https://debbugs.gnu.org/cgi/bugreport.cgi?bug=25299>)
>     +
>     +Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com
>     <mailto:heiko.thiery@gmail.com>>
>     +
>     +--- a/bin/aclocal.in <http://aclocal.in>
>     ++++ b/bin/aclocal.in <http://aclocal.in>
>     +@@ -69,7 +69,7 @@
>     + # ACLOCAL_PATH environment variable, and reset with the '--system-acdir'
>     + # option.
>     + my @user_includes = ();
>     +-my @automake_includes = ("@datadir@/aclocal-$APIVERSION");
>     ++my @automake_includes = ('@datadir@/aclocal-' . $APIVERSION);
>     + my @system_includes = ('@datadir@/aclocal');
>     +
>     + # Whether we should copy M4 file in $user_includes[0].
>     --
>     2.1.4
> 
>  
> Can someone give me some feedback if this patch is ok and will be accepted?

 You're a bit impatient, we have many patches pending review (cfr.
http://patchwork.ozlabs.org/project/buildroot/list/ ). That said, chances are
pretty low that anybody would look at this patch.

 The problem is that it's a kind of feature patch (it doesn't solve a
cross-compilation issue or regression), and it's not easy to understand if it
does the right thing. So we would typically want upstream feedback on it.
Unfortunately, there is no activity on the bug since 4 months (except for your +1).

 One thing that would help is if your commit message would clarify that the bug
only shows itself on packages that are autoreconf'ed, and a minimal defconfig
that allows someone to reproduce. Something like:

BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_LZO=y

make O=@output olddefconfig world


 And it would also help if you could give a list of autoreconf'ed packages that
you have tested with this patch.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
