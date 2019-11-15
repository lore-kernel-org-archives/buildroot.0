From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Nov 2019 21:13:40 +0100
Subject: [Buildroot] Rebuilding Linux after modifying Linux device tree
 in output/build directory?
In-Reply-To: <d508ce60a63d4182a02ddfadaeb042ac@EX13D04UEA001.ant.amazon.com>
References: <d508ce60a63d4182a02ddfadaeb042ac@EX13D04UEA001.ant.amazon.com>
Message-ID: <20191115211340.3c06fe96@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 15 Nov 2019 19:40:09 +0000
"Whitney, Scott" <scwhitn@amazon.com> wrote:

> I need to run some experiments where I may need to make a number of
> minor modifications to the Linux Device tree, for example to change
> PWM outputs to GPIO outputs, add some extra GPIO inputs, etc.
> 
> Is there a way that I can force a minimal rebuild based on such a
> local change?  Buildroot does not seem to keep track of many
> dependencies to trigger a rebuild such as the DTS file being newer
> than the Linux image.
> 
> Is "make linux-rebuild" a viable option, or is there a better way to
> rebuild only what is required due to the Device Tree change?

Running "make linux-rebuild" is what you want. It will rebuild just the
kernel, but not from scratch: it will simply run "make" in the kernel
source tree, so only the files you have changed will be rebuilt.

However, be careful: output/build/linux-<version>/ is a "temporary"
directory: the next time you run "make clean", it will be removed, and
all your changes will be lost. So, doing changes directly in
output/build/linux-<version>/ is only good for quick local hacks.

For more serious development, I'd recommend looking at using the
<pkg>_OVERRIDE_SRCDIR mechanism.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
