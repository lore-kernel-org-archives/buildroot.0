From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 02 Sep 2019 18:43:39 +0000
Subject: [Buildroot] [Bug 12166] New: Compiling nodejs for SAMA5D3 always
 crash with illegal instruction
Message-ID: <bug-12166-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12166

            Bug ID: 12166
           Summary: Compiling nodejs for SAMA5D3 always crash with illegal
                    instruction
           Product: buildroot
           Version: 2019.05.1
          Hardware: Other
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: marvin at mydatex.cz
                CC: buildroot at uclibc.org
  Target Milestone: ---

I compile buildroot with attached config for SAMA5D3 ARM CPU. When I enable
EABIHF and VFPv3-D16  (I test all combination of VFP)  nodejs always crash with
illegal instruction. I test many combination of version buildroot but always
crash. But I found solution. When I compile nodejs ouside buidroot but using
buildroot toolchain. All works perfect. When I backtrace and disassemble code I
found
that nodejs crash here:

 0x0073ddec <+160>:   vldr    d17, [r2]

If I understand this well that when I compile for VFPv3-D16 there should not be 
register D17 used. This generate illegal instruction. 

When I use this configure:

export CC=arm-buildroot-linux-uclibcgnueabihf-gcc  
export CXX=arm-buildroot-linux-uclibcgnueabihf-g++ 
export  CC_host="gcc -m32" 
export CXX_host="g++ -m32" 


/configure --prefix=../install --dest-cpu=arm --cross-compiling --dest-os=linux
  --with-arm-float-abi=hard --with-arm-fpu=vfpv3-d16

I mean then inside buidroot is to configure  passed wrong options
with-arm-fpu=vfpv3-d16.

Don't  hestiate contact me.

Dan

-- 
You are receiving this mail because:
You are on the CC list for the bug.
