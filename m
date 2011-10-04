From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Mon, 3 Oct 2011 19:12:48 -0500
Subject: [Buildroot] Question: Multiple versions of a package.
In-Reply-To: <20111001131940.08aa053b@skate>
References: <ADE657CA350FB648AAC2C43247A983F001F39DC568EC@AUSP01VMBX24.collaborationhost.net>
 <20111001131940.08aa053b@skate>
Message-ID: <ADE657CA350FB648AAC2C43247A983F001F39DC56C6E@AUSP01VMBX24.collaborationhost.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Saturday, October 01, 2011 4:20 AM, Thomas Petazzoni wrote:
> 
> Hello,
> 
> Le Fri, 30 Sep 2011 16:21:02 -0500,
> H Hartley Sweeten <hartleys@visionengravers.com> a ?crit :
> 
>> Can a package/*/*.mk file be setup to handle two different versions
>> of a package or should two separate package/* directories be created?
>> 
>> I'm trying to add the ParaGUI package to buildroot.  This is a widget
>> toolkit library that uses SDL.  It also needs libsigc++, which is
>> available in packages/, but it's an incompatible version.
>> 
>> The version of libsigc++ in buildroot is 2.2.8.  ParaGUI needs
>> libsigc++1.2 >= 1.2.5.  It appears that even though these libraries
>> do the same thing they have very different API's.
>> 
>> A similar issue occurs with the new version of SDL.  It has not been
>> offically released yet but SDL1.2 and SDL1.3 (2.0?) use completely
>> different APIs.
>> 
>> What's that bast way to handle this situation?
>
> There is basically two ways :
>
>  1) A single libsigc++ package, with a suboption to select the version
>     to be compiled. This solution does not allow two different versions
>     of libsigc++ to be built. For different versions of a library
>     having different ABIs, this solution is probably not appropriate.
>
>  2) Separate libsigc++ packages, with different names, like libsigc1
>     and libsigc2. This allows both versions to be built and installed
>     in the target, in case different applications require different
>     versions of the libsigc library.
>
> I guess in your case, solution 2) is the only way. This is also what
> traditional binary desktop distributions do.

Thomas,

Thanks for the information.

Using your suggestion (2) I was able to add both libsigc++ packages and
finally get the ParaGUI package to compile.

I have already submitted a patch to move package/libsigc to package/libsigc2.
If that one looks ok I'll submit the patches to add libsigc++1.2 and ParaGUI
for review.

Two issues I found with the ParaGUI package.

1) There is an error in one of the source files that breaks the build.
2) There is a bug in the configure script that breaks the sdl library linkage.

I have patches for both of these as part of the package/paragui patch.  Is this
normally how something like this would be handled?  The ParaGUI library is pretty
old and I don't think anyone is currently maintaining it.

I actually found a couple references to issue (2) on the web as a bug report to
Debian (Bug#551465) but nothing about an official patch to fix it.

Issue (1) might be the toolchain I am using.  The build breaks on a std::strlen()
Call, I just changed it to strlen() to get the build to complete.

Thanks,
Hartley
