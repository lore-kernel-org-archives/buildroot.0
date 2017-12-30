From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Dec 2017 11:51:17 +0100
Subject: [Buildroot] [PATCH] libtirpc: fix compilation error
In-Reply-To: <trinity-bca13856-de1a-42f4-a4d4-41193f6eaf92-1514616283921@3c-app-mailcom-bs04>
References: <20171229130333.13661-1-daggs@gmx.com>
 <20171229143805.7f083140@windsurf.lan>
 <trinity-145e0c2a-2583-47ec-b583-2128a636e7e6-1514557451788@3c-app-mailcom-bs06>
 <20171229222345.7ecb9545@windsurf.lan>
 <trinity-bca13856-de1a-42f4-a4d4-41193f6eaf92-1514616283921@3c-app-mailcom-bs04>
Message-ID: <20171230115117.7b80bb20@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 30 Dec 2017 07:44:43 +0100, daggs wrote:

> > I initially couldn't reproduce it, but after thinking more about the
> > problem, I understood what happened: you don't have RPC support
> > installed in your host system. The build of the rpcgen host program
> > fails to build because it can't find those headers, which on my system
> > (or the autobuilder instances) are provided system-wide.  
> weird, I have it too on my system:
> dagg at NCC-5001-D ~ $ ll /usr/include/tirpc/rpc/types.h
> -rw-r--r-- 1 root root 3270 Dec  1 15:44 /usr/include/tirpc/rpc/types.h

Notice how it is in /usr/include/tirpc, while on my system it is in:

$ ls -l /usr/include/rpc/types.h 
-rw-r--r-- 1 root root 3233 Dec  6 18:20 /usr/include/rpc/types.h

So, in your system, a #include <rpc/types.h> doesn't find it, while it
does on my system. I believe it's because on your system, the RPC
implementation comes from libtirpc, while on my system, it comes from
glibc.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
