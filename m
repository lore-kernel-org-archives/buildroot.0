From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Feb 2017 21:39:14 +0100
Subject: [Buildroot] [PATCH] assimp: work around gcc bug on SuperH
In-Reply-To: <1488148706-15109-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1488148706-15109-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20170227213914.290462bb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 26 Feb 2017 23:38:26 +0100, Thomas Petazzoni wrote:
> gcc versions earlier than gcc 6.x fail to build assimp on SuperH when
> static linking:
> 
>   AssxmlExporter.cpp:623:1: error: unable to find a register to spill in class 'GENERAL_REGS'
> 
> It's the combination of -Os and *not* having -fPIC that makes gcc
> fail, which explains why configurations with dynamic linking work
> fine.
> 
>  -Os -fPIC -> works
>  -Os       -> fails
>  -O2 -fPIC -> works
>  -O2       -> works
> 
> Therefore, as a workaround, we are forcing the use of -O2 on SuperH
> when the gcc version is older than gcc 6.x and we're statically
> linking.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/ec88aa8118179e30e24603cc45292047dca19216/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/assimp/assimp.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
