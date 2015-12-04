From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 4 Dec 2015 14:58:08 +0100
Subject: [Buildroot] Problem compiling kernel module
In-Reply-To: <980213507.13505384.1449236247504.JavaMail.zimbra@datacom.ind.br>
References: <980213507.13505384.1449236247504.JavaMail.zimbra@datacom.ind.br>
Message-ID: <20151204145808.5a0f2d9e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos,

On Fri, 4 Dec 2015 11:37:27 -0200 (BRST), Carlos Santos wrote:

> Does anybody know a better workaround? Should we try to improve
> buildroot in order to solve the problem? 

The kernel Makefile uses a variable called "CF", which allows you to
pass arguments down to sparse. Can you try something like:

diff --git a/linux/linux.mk b/linux/linux.mk
index 9507837..6406d92 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -68,7 +68,8 @@ LINUX_MAKE_FLAGS = \
        ARCH=$(KERNEL_ARCH) \
        INSTALL_MOD_PATH=$(TARGET_DIR) \
        CROSS_COMPILE="$(TARGET_CROSS)" \
-       DEPMOD=$(HOST_DIR)/sbin/depmod
+       DEPMOD=$(HOST_DIR)/sbin/depmod \
+       CF="-gcc-base-dir $(STAGING_DIR)/usr"
 
 LINUX_MAKE_ENV = \
        $(TARGET_MAKE_ENV) \

This is completely untested, so you might need to adjust things a bit,
but it gives an initial idea.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
