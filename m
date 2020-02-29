From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 29 Feb 2020 16:12:45 +0100
Subject: [Buildroot] [PATCH 1/1] package/dnsmasq: fix CVE-2019-14834
In-Reply-To: <20200229133437.2780453-1-fontaine.fabrice@gmail.com>
References: <20200229133437.2780453-1-fontaine.fabrice@gmail.com>
Message-ID: <20200229151245.GL8743@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-02-29 14:34 +0100, Fabrice Fontaine spake thusly:
> A vulnerability was found in dnsmasq before version 2.81, where the
> memory leak allows remote attackers to cause a denial of service
> (memory consumption) via vectors involving DHCP response creation.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  .../0004-Fix-memory-leak-in-helper-c.patch    | 49 +++++++++++++++++++
>  package/dnsmasq/dnsmasq.mk                    |  3 ++
>  2 files changed, 52 insertions(+)
>  create mode 100644 package/dnsmasq/0004-Fix-memory-leak-in-helper-c.patch
> 
> diff --git a/package/dnsmasq/0004-Fix-memory-leak-in-helper-c.patch b/package/dnsmasq/0004-Fix-memory-leak-in-helper-c.patch
> new file mode 100644
> index 0000000000..c00a9cc3ef
> --- /dev/null
> +++ b/package/dnsmasq/0004-Fix-memory-leak-in-helper-c.patch
> @@ -0,0 +1,49 @@
> +From 69bc94779c2f035a9fffdb5327a54c3aeca73ed5 Mon Sep 17 00:00:00 2001
> +From: Simon Kelley <simon@thekelleys.org.uk>
> +Date: Wed, 14 Aug 2019 20:44:50 +0100
> +Subject: [PATCH] Fix memory leak in helper.c
> +
> +Thanks to Xu Mingjie <xumingjie1995@outlook.com> for spotting this.
> +[Retrieved from:
> +http://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=69bc94779c2f035a9fffdb5327a54c3aeca73ed5]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + src/helper.c |   12 +++++++++---
> + 1 file changed, 9 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/helper.c b/src/helper.c
> +index 33ba120..c392eec 100644
> +--- a/src/helper.c
> ++++ b/src/helper.c
> +@@ -80,7 +80,8 @@ int create_helper(int event_fd, int err_fd, uid_t uid, gid_t gid, long max_fd)
> +   pid_t pid;
> +   int i, pipefd[2];
> +   struct sigaction sigact;
> +-
> ++  unsigned char *alloc_buff = NULL;
> ++  
> +   /* create the pipe through which the main program sends us commands,
> +      then fork our process. */
> +   if (pipe(pipefd) == -1 || !fix_fd(pipefd[1]) || (pid = fork()) == -1)
> +@@ -186,11 +187,16 @@ int create_helper(int event_fd, int err_fd, uid_t uid, gid_t gid, long max_fd)
> +       struct script_data data;
> +       char *p, *action_str, *hostname = NULL, *domain = NULL;
> +       unsigned char *buf = (unsigned char *)daemon->namebuff;
> +-      unsigned char *end, *extradata, *alloc_buff = NULL;
> ++      unsigned char *end, *extradata;
> +       int is6, err = 0;
> +       int pipeout[2];
> + 
> +-      free(alloc_buff);
> ++      /* Free rarely-allocated memory from previous iteration. */
> ++      if (alloc_buff)
> ++	{
> ++	  free(alloc_buff);
> ++	  alloc_buff = NULL;
> ++	}
> +       
> +       /* we read zero bytes when pipe closed: this is our signal to exit */ 
> +       if (!read_write(pipefd[0], (unsigned char *)&data, sizeof(data), 1))
> +-- 
> +1.7.10.4
> +
> diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
> index f271523068..3f25ac0885 100644
> --- a/package/dnsmasq/dnsmasq.mk
> +++ b/package/dnsmasq/dnsmasq.mk
> @@ -15,6 +15,9 @@ DNSMASQ_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES)
>  DNSMASQ_LICENSE = GPL-2.0 or GPL-3.0
>  DNSMASQ_LICENSE_FILES = COPYING COPYING-v3
>  
> +# 0004-Fix-memory-leak-in-helper-c.patch
> +DNSMASQ_IGNORE_CVES += CVE-2019-14834
> +
>  DNSMASQ_I18N = $(if $(BR2_SYSTEM_ENABLE_NLS),-i18n)
>  
>  ifneq ($(BR2_PACKAGE_DNSMASQ_DHCP),y)
> -- 
> 2.25.0
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
