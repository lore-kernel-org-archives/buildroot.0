From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 15 Jul 2011 13:53:52 +0200
Subject: [Buildroot] linux: why is vmlinux only available for mips?
In-Reply-To: <87wrfjano0.fsf@macbook.be.48ers.dk>
References: <CAAXf6LX2ApVsZ18tTuj4eqEYtAzKBHSXBMdhSJCPL+25YcJX8A@mail.gmail.com>
 <CAAXf6LUUFNFF+xCQJX2juonZTXh8V1HBVqDRjjSJ1VMJXUyQFg@mail.gmail.com>
 <201107151122.41685.yann.morin.1998@anciens.enib.fr>
 <CAAXf6LXwcpiXfJF26ABizR5y3KuJ2OCVHSyyhQePzxCeG-H6bg@mail.gmail.com>
 <87wrfjano0.fsf@macbook.be.48ers.dk>
Message-ID: <CAAXf6LV91yxQ8JLRRR=NYz7wRRdHTjaQ_eFnurRBBX=yvAiWDw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jul 15, 2011 at 11:38 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:
>
> ?>> Or you can use the BR2_LINUX_KERNEL_VERSION variable:
> ?>> ?output/build/linux-${BR2_LINUX_KERNEL_VERSION}/
>
> ?Thomas> This works fine in the context of buildroot. However, I need to access
> ?Thomas> these files from a non-buildroot context (external makefiles/scripts)
> ?Thomas> and so the variable BR2_LINUX_KERNEL_VERSION is not known.
>
> You can always use wildcards - E.G. output/build/linux-*/scripts/..

That doesn't work if you started out with one version, say 2.6.34,
then step up to another version 2.6.35 in the same buildroot
environment. The wildcard would match both, while you want only the
active one.
Forcing the developer to remove the old linux directory is not
user-friendly IMO.

The patch I currently applied to fix this is:
diff --git a/linux/linux.mk b/linux/linux.mk
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -175,7 +175,11 @@ endif
        fi
        $(Q)touch $@

-linux linux26: host-module-init-tools $(LINUX26_DEPENDENCIES)
$(LINUX26_DIR)/.stamp_installed
+# Generic 'linux' symlink
+$(BUILD_DIR)/linux: $(LINUX26_DIR)/.stamp_installed
+       ln -snf $(LINUX26_DIR) $@
+
+linux linux26: host-module-init-tools $(LINUX26_DEPENDENCIES)
$(LINUX26_DIR)/.stamp_installed $(BUILD_DIR)/linux

 linux-menuconfig linux-xconfig linux-gconfig linux-nconfig
linux26-menuconfig linux26-xconfig linux26-gconfig linux26-nconfig:
dirs $(LINUX26_DIR)/.stamp_configured
        $(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) \

Thomas
