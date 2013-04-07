From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Apr 2013 22:45:29 +0200
Subject: [Buildroot] [PATCH v2 3/7] arch: toolchain: Introduce binary
 formats BINFMT_*.
In-Reply-To: <1364550643-11793-3-git-send-email-sonic.adi@gmail.com>
References: <1364550643-11793-1-git-send-email-sonic.adi@gmail.com>
 <1364550643-11793-3-git-send-email-sonic.adi@gmail.com>
Message-ID: <20130407224529.708588a8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sonic Zhang,

On Fri, 29 Mar 2013 17:50:39 +0800, Sonic Zhang wrote:
> From: Sonic Zhang <sonic.zhang@analog.com>
> 
> v2-changes:
> none
> 
> v1-changes:
> - Just introduce the symbol and options in arch generic Config.in.
> Append FLAT format link flags to external toolchain wrapper.
> 
> Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>

As detailed in my comments to PATCH 1/7, this patch needs to be
refactored with BR2_BFIN_FDPIC/BR2_BFIN_FLAT to avoid breaking existing
code.

Also, I believe we want to add some architecture dependencies here. For
the beginning, we at least want something like:

+# Set up target binary format
+choice
+	prompt "Target Binary Format"
+	default BR2_BINFMT_ELF
+config BR2_BINFMT_ELF
+	bool "ELF"
+	depends on !BR2_bfin
+config BR2_BINFMT_FDPIC
+	bool "FDPIC"
+	depends on BR2_bfin
+config BR2_BINFMT_FLAT
+	bool "FLAT"
+	select BR2_PREFER_STATIC_LIB
+	depends on BR2_bfin
+endchoice

Of course, this might be extended later on if we enable FLAT support on
other architectures. But for now, it ensures that users can't make an
invalid choice (like chose FDPIC on ARM).

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
