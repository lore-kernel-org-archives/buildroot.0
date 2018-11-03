From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Nov 2018 15:00:33 +0100
Subject: [Buildroot] [PATCH 4/4] scripts/check-bin-arch: fix failure
 with bpf
In-Reply-To: <CAPi7W80r=y9NZseUxw31Mq_9nhPcRjK+AJrE_TbjvXUzGehnNw@mail.gmail.com>
References: <20181103122758.10578-1-fontaine.fabrice@gmail.com>
 <20181103122758.10578-4-fontaine.fabrice@gmail.com>
 <20181103142020.0d7e9005@windsurf>
 <CAPi7W80r=y9NZseUxw31Mq_9nhPcRjK+AJrE_TbjvXUzGehnNw@mail.gmail.com>
Message-ID: <20181103150033.1e4d78d2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 3 Nov 2018 14:53:48 +0100, Fabrice Fontaine wrote:

> I wasn't able to reproduce this "None" architecture issue.
> But I think it was "None" because the llvm/clang found on Peter's
> machine was very old (3.8):
> clang -idirafter /usr/local/include -idirafter
> /usr/lib/llvm-3.8/bin/../lib/clang/3.8.1/include -idirafter
> /usr/include/x86_64-linux-gnu -idirafter /usr/include
> -I../../../include -target bpf -O2 -c grundig.c
> 
> With my patch's serie, I'm building a host-clang in version 7.0 that
> supports BPF and in this case the architecture is correctly set to
> "Linux BPF".
> I tested with a clang in version 6.0 installed from Ubuntu 18.04
> repositories on my host machine and it was also "Linux BPF".

OK, but then you're not fixing the problem on Peter's machine: with
your patch series, if he doesn't enable BR2_PACKAGE_ELFUTILS, libv4l
configure script will still detect the system-wide clang/llvm
installed, which will produce those bogus "None" binaries.

Which is why there is a need to explicitly disable building the BPF
protocol support, except if we know that Buildroot is providing all the
necessary dependencies.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
