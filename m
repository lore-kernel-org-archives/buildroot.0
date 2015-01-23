From: spam at douglasheld.net <spam@douglasheld.net>
Date: Fri, 23 Jan 2015 07:55:28 +0000
Subject: [Buildroot] wrap Buildroot compilation for static analysis
Message-ID: <CAG--3ku7jZbAiiueUH6ukXwZG4dJQ+XBr9TEiafG3SOt2cRwVQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi list,

I have some commercial software called Fortify SCA that wraps a compiler
command, to build an analysis model of the code.  I would like to analyze
OpenWRT and I see that it implements Buildroot.

For each time the build system invokes a command like 'gcc <compiler
args>', I would like to capture this information and run a command
'sourceanalyzer <sca args> gcc <compiler args>'.

With makefiles, this is a pretty well solved problem; I can invoke
sourceanalyzer <sca args> make <make args>
and that makes some wrapper scripts for gcc, g++ etc. that invoke
sourceanalyzer correctly. But I am finding the Buildroot build sequence a
little incomprehensible.

For example, a shortcut I tried is:

#i.e., build the toolchain and then the product
make
# find and remove selected object files
find ./package/libnl-tiny | egrep '\.o$|\.so$' | xargs rm
# try my wrapper on limited number of files
sourceanalyzer <sca args> make

But the final command doesn't detect the missing .o files and rebuild
them.  Instead it indicates a fatal error in libnl-tiny.so not existing as
expected.

Any indication where I should be looking? I didn't imagine the OpenWRT guys
would be able to answer questions about the underlying build system.

Thanks
Doug



-- 
spam at douglasheld.net
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150123/ae7602b8/attachment.html>
