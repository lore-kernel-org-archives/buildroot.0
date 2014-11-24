From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Nov 2014 14:45:56 +0100
Subject: [Buildroot] buildroot does not copy the C++ headers to sysroot
In-Reply-To: <1600692898.53530555.1416834863233.JavaMail.root@telenet.be>
 (bart thoelen's message of "Mon, 24 Nov 2014 14:14:23 +0100 (CET)")
References: <1600692898.53530555.1416834863233.JavaMail.root@telenet.be>
Message-ID: <87oarwu2y3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "bart" == bart thoelen <bart.thoelen@telenet.be> writes:

Hi,

 > Hi, 
 > I successfully have created myself a basic kernel image and rootfs
 > using buildoot (2014.08). Im using the codesourcery arm-xilinx-linux
 > toolchain (2013.05) as an external toochain.

Great! Your .config mentions a locally installed Xilinx toolchain
though.


 > I'm trying to add a C++ (autotools-generated) project but this fails
 > to compile with message "cc1plus: error: include location
 > "/usr/include" is unsafe for cross-compilation

That sounds wrong. You shouldn't be looking in /usr/include for your
cross-headers. How does the exact $cross-g++ invocation look like?


> [-Werror=poison-system-directories]".
 > The project compiles perfectly when manually configured for the toochain (hence not using buildroot). 

 > After some debugging I found that the C++ headers have not copied from
 > the external toolchain into the buildroot's output/host folder. The
 > libs are there - very strangly.

Are you sure you are looking in the correct location?
output/host/usr/include is the headers for host libraries. The headers
for the target libraries are in output/staging/usr/include (which is a
symlink to output/hosr/usr/$tripplet)

We do plenty (hundreds) of tests of packages using C++ every single day
on http://autobuild.buildroot.net, so it would be very odd if Buildroot
didn't copy things correctly.


 > As a test I made a make clean, configured buildroot to use and
 > download the codesourcery toolchain 2013.05m but still the same issue.

 > What I'm doing wrong here ?? 

 > buildroot .confg and the projects .mk included. 

 > Many thanks. 

 > BartT 



 > ################################################################################
 > #
 > # nmcmdserver
 > #
 > ################################################################################

 > NMCMDSERVER_VERSION = 1.0
 > NMCMDSERVER_NAME = nmcmdserver
 > NMCMDSERVER_SITE = package/nikon/nmcmdserver/
 > NMCMDSERVER_SITE_METHOD = local
 > NMCMDSERVER_CONF_OPT = --disable-shared --enable-static
 > NMCMDSERVER_LIBFOO_DEPENDENCIES = nm_libraries

Without the source code of nmcmdserver and nm_libraries there isn't much
we can do until you provide some more information of what exactly goes
wrong.

-- 
Bye, Peter Korsgaard
