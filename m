From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Jan 2011 22:08:33 +0100
Subject: [Buildroot] Can Buildroot be configured to use the ELDK
 toolchain as an External Toolchain?
In-Reply-To: <20110126084547.0a47a506@surf>
References: <2B25428B-FDE1-4E48-A13D-45B6B7E9706B@gmail.com>
	<20110126084547.0a47a506@surf>
Message-ID: <20110126220833.24a1c7ea@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 26 Jan 2011 08:45:47 +0100
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Unfortunately, last time I checked, the ELDK toolchains did not support
> the --sysroot option, which is mandatory to use a given toolchain as an
> external toolchain in Buildroot. We have tried to support non
> sysroot-capable toolchains, but it was the source of various issues,
> and since sysroot is now quite ancient and available in most
> toolchains, it sounded like a reasonable tradeoff.

Ok, I had a look at ELDK, and unfortunately, it cannot work. I will
updated the documentation accordingly, but here is the diff of what I
will push into the documentation:

+    <p>We do not support toolchains from
+    the <a href="http://www.denx.de/wiki/DULG/ELDK">ELDK of Denx</a>,
+    for two reasons:</p>
+
+    <ul>
+
+      <li>The ELDK does not contain a pure toolchain (i.e just the
+      compiler, binutils, the C and C++ libraries), but a toolchain
+      that comes with a very large set of pre-compiled libraries and
+      programs. Therefore, Buildroot cannot import the <i>sysroot</i>
+      of the toolchain, as it would contain hundreds of megabytes of
+      pre-compiled libraries that are normally built by
+      Buildroot.</li>
+
+      <li>The ELDK toolchains have a completely non-standard custom
+      mechanism to handle multiple library variants. Instead of using
+      the standard GCC <i>multilib</i> mechanism, the ARM ELDK uses
+      different symbolic links to the compiler to differentiate
+      between library variants (for ARM soft-float and ARM VFP), and
+      the PowerPC ELDK compiler uses a <code>CROSS_COMPILE</code>
+      environment variable. This non-standard behaviour makes it
+      difficult to support ELDK in Buildroot.</li>
+
+    </ul>

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
