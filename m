From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 10 Nov 2018 08:59:05 +0100
Subject: [Buildroot] [PATCH 1/1] libiscsi: fix build failures due to
 warnings
In-Reply-To: <20181109175740.28258-1-fontaine.fabrice@gmail.com>
References: <20181109175740.28258-1-fontaine.fabrice@gmail.com>
Message-ID: <20181110075905.GC2445@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2018-11-09 18:57 +0100, Fabrice Fontaine spake thusly:
> Retrieve two upstream patches to fix build failures due to warnings
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/7ec1e1cc060bbdaaf758c0d55a053247b731e792
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  ...ng-message-that-includes-target-name.patch | 29 +++++++++++++++++++
>  package/libiscsi/0003-avoid-fallthrough.patch | 24 +++++++++++++++
>  2 files changed, 53 insertions(+)
>  create mode 100644 package/libiscsi/0002-avoid-truncation-when-logging-message-that-includes-target-name.patch
>  create mode 100644 package/libiscsi/0003-avoid-fallthrough.patch
> 
> diff --git a/package/libiscsi/0002-avoid-truncation-when-logging-message-that-includes-target-name.patch b/package/libiscsi/0002-avoid-truncation-when-logging-message-that-includes-target-name.patch
> new file mode 100644
> index 0000000000..1334a8352c
> --- /dev/null
> +++ b/package/libiscsi/0002-avoid-truncation-when-logging-message-that-includes-target-name.patch
> @@ -0,0 +1,29 @@
> +From bffafc1c3003c2ee05d28eaa345e5854bc36014d Mon Sep 17 00:00:00 2001
> +From: Paolo Bonzini <pbonzini@redhat.com>
> +Date: Mon, 1 Oct 2018 14:16:14 +0200
> +Subject: [PATCH] avoid truncation when logging message that includes target
> + name
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Retrieved from:
> +https://github.com/sahlberg/libiscsi/commit/bffafc1c3003c2ee05d28eaa345e5854bc36014d]
> +---
> + lib/logging.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/lib/logging.c b/lib/logging.c
> +index be518fc5..61c74407 100644
> +--- a/lib/logging.c
> ++++ b/lib/logging.c
> +@@ -73,9 +73,9 @@ iscsi_log_message(struct iscsi_context *iscsi, int level, const char *format, ..
> + 	}
> + 
> + 	if (iscsi->target_name[0]) {
> +-		static char message2[1024];
> ++		static char message2[1282];
> + 
> +-		snprintf(message2, 1024, "%s [%s]", message, iscsi->target_name);
> ++		snprintf(message2, 1282, "%s [%s]", message, iscsi->target_name);
> + 		iscsi->log_fn(level, message2);
> + 	}
> + 	else
> diff --git a/package/libiscsi/0003-avoid-fallthrough.patch b/package/libiscsi/0003-avoid-fallthrough.patch
> new file mode 100644
> index 0000000000..94f653a99c
> --- /dev/null
> +++ b/package/libiscsi/0003-avoid-fallthrough.patch
> @@ -0,0 +1,24 @@
> +From 679d0abe7c142df178a907397551c4d9695cc667 Mon Sep 17 00:00:00 2001
> +From: Paolo Bonzini <pbonzini@redhat.com>
> +Date: Mon, 1 Oct 2018 14:14:24 +0200
> +Subject: [PATCH] avoid fallthrough
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Retrieved from:
> +https://github.com/sahlberg/libiscsi/commit/679d0abe7c142df178a907397551c4d9695cc667]
> +---
> + lib/scsi-lowlevel.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/lib/scsi-lowlevel.c b/lib/scsi-lowlevel.c
> +index 5ddd709c..747ce0c4 100644
> +--- a/lib/scsi-lowlevel.c
> ++++ b/lib/scsi-lowlevel.c
> +@@ -1086,6 +1086,7 @@ scsi_maintenancein_datain_getfullsize(struct scsi_task *task)
> + 				(task_get_uint8(task, 1) & 0x80) ? 12 : 0 +
> + 				task_get_uint16(task, 2);
> + 		}
> ++		return -1;
> + 	default:
> + 		return -1;
> + 	}
> -- 
> 2.17.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
