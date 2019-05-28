From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 29 May 2019 00:04:18 +0200
Subject: [Buildroot] Changing the way the kernel is build from an
 external layer
In-Reply-To: <CAD_3qOCONVb4P1EU1ARRpOEJx5AwB-8JUV1F8+vax6EudODWvA@mail.gmail.com>
References: <CAD_3qOCONVb4P1EU1ARRpOEJx5AwB-8JUV1F8+vax6EudODWvA@mail.gmail.com>
Message-ID: <a4b86ff9-4161-eeee-a072-98aafbaf25e1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28/05/2019 10:24, Ottavio Campana wrote:
> Hello,
> 
> I am porting a BSP to buildroot, to make the full build of the system automatic.
> 
> Everything is fine, but I have a problem with the kernel. The kernel
> is provided in form of a tarball, but inside the tarball also drivers
> are present. The contents of the tarball, once expanded, can be
> summarized as:
> 
> source folder
> * kernel folder
> * first folder with a bunch of drivers
> * other folder with other drivers

 If your suppliers gives you this kind of rubbish, in all likelihood it will not
work very well :-/


> The contents of the content is not compatible with the tarball
> mechanism provided by buildroot, which expands the the tarball and
> expects to find the kernel sources at the first level. Moreover,
> drivers seem to have some hard coded paths to the kernel source.

 And that's even worse!


> I would like to avoid patching the build script in buildroot. Is there
> a way to change the way the kernel is compiled by using scripts in an
> external layer? In chapter 9 of the buildroot I find many tools to
> change/add the packages, but I am not able to find a way to change the
> way the kernel is compiled.

 You have two options, basically:

1. Build the kernel outside of Buildroot, using whatever scripts the supplier
gave you to build the kernel, and adding $HOST_DIR/bin to the PATH. You can
still call this build from the Buildroot post-build script so you still can do
the complete build with one 'make' command.

2. Pick the tarball apart and properly clean it up - preferably, start from a
clone of the linux git repository and import the tarball into it.

 The second approach is a lot more work, obviously, but it's also maintainable
while the first one is a dead end. But if you don't need to maintain this
product for a very long time and you don't need to do bugfixing, it can be a
convenient approach.

 Regards,
 Arnout
