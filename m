From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Jun 2017 11:27:29 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
	2017-06-02
In-Reply-To: <20170605214638.GD3944@scaer>
References: <20170603063112.06C5220F36@mail.free-electrons.com>
 <20170605214638.GD3944@scaer>
Message-ID: <20170606112729.3dea728b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 5 Jun 2017 23:46:38 +0200, Yann E. MORIN wrote:

> On 2017-06-03 08:31 +0200, Thomas Petazzoni spake thusly:
> > Build failures related to your packages:
> >       x86_64 | freerdp-17834af7bb378f85a3b... | http://autobuild.buildroot.net/results/59077f8c4e06fd976b85a6da302fe9809753d536  
> 
> I was not able to reproduce it, even with just runnint "make".

I was able to reproduce, and it's once again a {#[@^\@^\{#[ rpath
problem, with CMake adding /usr/lib to the rpath.

The link command line contains:

-Wl,-rpath,/home/test/outputs/59077f8c4e06fd976b85a6da302fe9809753d536/output/build/freerdp-17834af7bb378f85a3b3cc4dcadaa5125a337e16/client/X11:/usr/lib:/home/test/outputs/59077f8c4e06fd976b85a6da302fe9809753d536/output/build/freerdp-17834af7bb378f85a3b3cc4dcadaa5125a337e16/client/common:/home/test/outputs/59077f8c4e06fd976b85a6da302fe9809753d536/output/build/freerdp-17834af7bb378f85a3b3cc4dcadaa5125a337e16/libfreerdp:/home/test/outputs/59077f8c4e06fd976b85a6da302fe9809753d536/output/build/freerdp-17834af7bb378f85a3b3cc4dcadaa5125a337e16/winpr/libwinpr:

Changing that to:

-Wl,-rpath,/home/test/outputs/59077f8c4e06fd976b85a6da302fe9809753d536/output/build/freerdp-17834af7bb378f85a3b3cc4dcadaa5125a337e16/client/X11:/home/test/outputs/59077f8c4e06fd976b85a6da302fe9809753d536/output/build/freerdp-17834af7bb378f85a3b3cc4dcadaa5125a337e16/client/common:/home/test/outputs/59077f8c4e06fd976b85a6da302fe9809753d536/output/build/freerdp-17834af7bb378f85a3b3cc4dcadaa5125a337e16/libfreerdp:/home/test/outputs/59077f8c4e06fd976b85a6da302fe9809753d536/output/build/freerdp-17834af7bb378f85a3b3cc4dcadaa5125a337e16/winpr/libwinpr:

fixes the build (well at least that one binary links fine, I haven't
tested the rest of the defconfig).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
