From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Nov 2015 14:24:55 +0100
Subject: [Buildroot] [PATCH v2] openssl: fix race condition when symlink
	shared libs
In-Reply-To: <1448036610-7077-1-git-send-email-ryan.barnett@rockwellcollins.com>
References: <1448036610-7077-1-git-send-email-ryan.barnett@rockwellcollins.com>
Message-ID: <565070A7.10001@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20-11-15 17:23, Ryan Barnett wrote:
> The build-shared target depends on do_crypto and link-shared, which
> will be executed in parallel. do_crypto calls
> link_a.linux_shared -> link_a.gnu which does SYMLINK_SO; in parallel,
> link-shared calls symlink.linux_shared which also does SYMLINK_SO.
> Before the symlink is created, it is rm'ed, but there is a tiny chance
> that the second one is created after the rm has been called.
> 
> Fix this by using 'ln -sf' instead of 'ln -s' so the build doesn't
> error out.
> 
> Patch submitted upstream at:
>   https://bugs.gentoo.org/show_bug.cgi?id=566260

 Ahem, gentoo is not exactly upstream :-)  From [1]:

To report a bug or make an enhancement request, send email to rt at openssl.org. In
the subject line, please make sure to indicate if it's a bug or a fix, and a
brief description of the issue. In the body of your mail, please include the
versions of the operating system and OpenSSL you are using. If you have a patch
or diff, please send it as an attachment, and not inline in the message body.

 As far as I can see, this patch should still apply (in slightly adapted form)
to the real upstream.

> 
> Thanks to Arnout for explain the issue (wording used above).

 You're a native English speaker, right? explain -> explaining :-)


 Some more minor things below, but anyway more for the upstreams. So

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


> 
> Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
> CC: Arnout Vandecappelle <arnout@mind.be>
> CC: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> ---
> 
> Note this is a temporary fix until a gentoo maintainer weighs in and
> updates their parallel build patch.
> 
>  v1 -> v2
>    Remove the 'rm -f' since we are using 'ln -sf' (Arnout originally)
> ---
>  ...ared-fix-race-condition-when-symlinking-s.patch | 48 ++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 package/openssl/0003-makefile.shared-fix-race-condition-when-symlinking-s.patch
> 
> diff --git a/package/openssl/0003-makefile.shared-fix-race-condition-when-symlinking-s.patch b/package/openssl/0003-makefile.shared-fix-race-condition-when-symlinking-s.patch
> new file mode 100644
> index 0000000..d6672f4
> --- /dev/null
> +++ b/package/openssl/0003-makefile.shared-fix-race-condition-when-symlinking-s.patch
> @@ -0,0 +1,48 @@
> +From 878793890a9b84ff313397c56478d7c6f770b2d2 Mon Sep 17 00:00:00 2001
> +From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
> +Date: Thu, 19 Nov 2015 10:47:00 -0600
> +Subject: [PATCH] makefile.shared: fix race condition when symlinking shared
> + libs
> +
> +The build-shared target depends on do_crypto and link-shared, which
> +will be executed in parallel. do_crypto calls
> +link_a.linux_shared -> link_a.gnu which does SYMLINK_SO; in parallel,
> +link-shared calls symlink.linux_shared which also does SYMLINK_SO.
> +Before the symlink is created, it is rm'ed, but there is a tiny chance
> +that the second one is created after the rm has been called.
> +
> +Fix this race condition by just using ln -sf since it will be the same
> +symlink regards and not cause the build to error out.

 regards -> regardless

> +
> +Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
> +---
> + Makefile.shared | 8 ++++----
> + 1 file changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/Makefile.shared b/Makefile.shared
> +index 8d57163..8ab3d18 100644
> +--- a/Makefile.shared
> ++++ b/Makefile.shared
> +@@ -117,15 +117,15 @@ SYMLINK_SO=	\
> + 		prev=$$SHLIB$$SHLIB_SOVER$$SHLIB_SUFFIX; \
> + 		if [ -n "$$SHLIB_COMPAT" ]; then \
> + 			for x in $$SHLIB_COMPAT; do \
> +-				( $(SET_X); rm -f $$SHLIB$$x$$SHLIB_SUFFIX; \
> +-				  ln -s $$prev $$SHLIB$$x$$SHLIB_SUFFIX ); \
> ++				( $(SET_X);  \
> ++				  ln -sf $$prev $$SHLIB$$x$$SHLIB_SUFFIX ); \
> + 				prev=$$SHLIB$$x$$SHLIB_SUFFIX; \
> + 			done; \
> + 		fi; \
> + 		if [ -n "$$SHLIB_SOVER" ]; then \
> + 			[ -e "$$SHLIB$$SHLIB_SUFFIX" ] || \

 This check is not really needed anymore.


 Regards,
 Arnout


[1] https://www.openssl.org/community/


> +-			( $(SET_X); rm -f $$SHLIB$$SHLIB_SUFFIX; \
> +-			  ln -s $$prev $$SHLIB$$SHLIB_SUFFIX ); \
> ++			( $(SET_X); \
> ++			  ln -sf $$prev $$SHLIB$$SHLIB_SUFFIX ); \
> + 		fi; \
> + 	fi
> + 
> +-- 
> +1.9.1
> +
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
