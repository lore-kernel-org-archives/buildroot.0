From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 31 Dec 2018 15:54:59 +0100
Subject: [Buildroot] [PATCH 1/1] package/grpc: add explicitly link with
 libatomic
In-Reply-To: <20181207171241.27832-1-ryan.barnett@rockwellcollins.com>
References: <20181207171241.27832-1-ryan.barnett@rockwellcollins.com>
Message-ID: <20181231155459.578e7030@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  7 Dec 2018 11:12:41 -0600, Ryan Barnett wrote:
> On some architectures, you must link with libatomic, on some other
> architectures, they are available built-in, but in all cases, linking
> against libatomic does not harm.
> 
> Fixes:
>   http://autobuild.buildroot.org/results/2f2/2f208fbfe4e9da94be5b9c030dbd278cb8ba053c/
> 
> Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>

It's a bit more complicated than that:

 - If it uses atomic built-ins, one needs to "depends on
   BR2_TOOLCHAIN_HAS_ATOMIC"

 - It can also use sync builtins.

So I've fixed that up, and applied your patch with the following
changes:

    [Thomas:
     - add the dependency on sync or atomic builtins in Config.in
     - use -DCMAKE_EXE_LINKER_FLAGS instead of
       -DCMAKE_C_STANDARD_LIBRARIES, to be consistent with what we do in
       some other cmake-based packages
     - tweak commit log]

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
