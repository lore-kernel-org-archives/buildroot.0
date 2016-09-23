From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 23 Sep 2016 22:51:19 +0200
Subject: [Buildroot] [PATCH] package/coreutils: add -i/-p option to uname
In-Reply-To: <1474620889-5777-1-git-send-email-marcin.nowakowski@imgtec.com>
References: <1474620889-5777-1-git-send-email-marcin.nowakowski@imgtec.com>
Message-ID: <ba5a3feb-c508-cd8f-e62f-bf3890fca801@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Marcin,

 Think you for your contribution.


On 23-09-16 10:54, Marcin Nowakowski wrote:
> This patch adds -i/-p options to uname app using a patch from Fedora
> tree. These options are described as non-portable, but the same patch
> (with various smaller or larger variations) is applied to the most
> popular linux distros (Fedora, Debian, Ubuntu), so some linux tools
> expect these to work.

 In buildroot, we follow upstream as tightly as possible. We don't include
feature patches, because we want to reduce the number as patches as much as
possible, to ease the maintenance burden. For feature patches the only way to go
is to convince upstream to take them.

 This looks like a feature patch to me. It does not fix a build problem, it does
not fix an execution problem of this package. If there is some other package
that really needs this, then that other package can be patches instead.

 In addition, the same would have to be done for the busybox version of uname.

 For these reasons, I have marked your patch as rejected in our patch tracking
system. It will not be applied.

 If you have reasons why this patch is required after all, please tell us.


 Regards,
 Arnout

> 
> Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
> ---
>  .../0002-uname-processortype-from-fedora.patch     | 53 ++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 package/coreutils/0002-uname-processortype-from-fedora.patch
> 
> diff --git a/package/coreutils/0002-uname-processortype-from-fedora.patch b/package/coreutils/0002-uname-processortype-from-fedora.patch
> new file mode 100644
> index 0000000..bf8a309
> --- /dev/null
> +++ b/package/coreutils/0002-uname-processortype-from-fedora.patch
> @@ -0,0 +1,53 @@
> +From 99cafffe1000517f9af550210c84fed4c4ceb49d Mon Sep 17 00:00:00 2001
> +From: Ondrej Vasik <ovasik@fedoraproject.org>
> +Date: Sat, 19 Dec 2009 08:42:03 +0000
> +Subject: bring back uname -p/-i functionality
> +
> +diff -urNp coreutils-8.2-orig/src/uname.c coreutils-8.2/src/uname.c
> +--- coreutils-8.2-orig/src/uname.c	2009-09-23 10:25:44.000000000 +0200
> ++++ coreutils-8.2/src/uname.c	2009-12-19 09:09:11.663607110 +0100
> +@@ -299,13 +299,19 @@ main (int argc, char **argv)
> + 
> +   if (toprint & PRINT_PROCESSOR)
> +     {
> +-      char const *element = unknown;
> ++      char *element = unknown;
> + #if HAVE_SYSINFO && defined SI_ARCHITECTURE
> +       {
> +         static char processor[257];
> +         if (0 <= sysinfo (SI_ARCHITECTURE, processor, sizeof processor))
> +           element = processor;
> +       }
> ++#else
> ++      {
> ++	static struct utsname u;
> ++	uname(&u);
> ++	element = u.machine;
> ++      }
> + #endif
> + #ifdef UNAME_PROCESSOR
> +       if (element == unknown)
> +@@ -343,7 +349,7 @@ main (int argc, char **argv)
> + 
> +   if (toprint & PRINT_HARDWARE_PLATFORM)
> +     {
> +-      char const *element = unknown;
> ++      char *element = unknown;
> + #if HAVE_SYSINFO && defined SI_PLATFORM
> +       {
> +         static char hardware_platform[257];
> +@@ -351,6 +357,14 @@ main (int argc, char **argv)
> +                           hardware_platform, sizeof hardware_platform))
> +           element = hardware_platform;
> +       }
> ++#else
> ++      {
> ++	static struct utsname u;
> ++	uname(&u);
> ++	element = u.machine;
> ++	if(strlen(element)==4 && element[0]=='i' && element[2]=='8' && element[3]=='6')
> ++		element[1]='3';
> ++      }
> + #endif
> + #ifdef UNAME_HARDWARE_PLATFORM
> +       if (element == unknown)
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
