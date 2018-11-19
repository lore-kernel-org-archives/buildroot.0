From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 19 Nov 2018 00:22:24 -0200
Subject: [Buildroot] Builtin kernel images for the testing infra
References: <CANQCQpa+p3sxjO9M14ptoxaNWJMZ22FdYOmG_jEwT1pk4mkoDQ@mail.gmail.com>
Message-ID: <5bf21e60dc34c_14b03ff574120a44459ee@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I renamed the mail thread (much easier to search for, a few months from now):
-[PATCH 3/5] support/testing/infra/emulator.py: support aarch64
+Builtin kernel images for the testing infra

Warning: a lot of opinions from my side. I certainly missed something.

On Fri, Nov 16, 2018 at 10:57 PM, Matthew Weber wrote:

> On Fri, Nov 16, 2018 at 4:13 PM Ricardo Martincoski
> <ricardo.martincoski@gmail.com> wrote:
[snip]
>> If we think more and more test cases would need/want this we could add this
>> here, preferably as a "builtin" pre-compiled kernel for aarch64.
>>
>> But for now, I suggest to move this code to the test case.
> 
> I think I'm good either way and asked a bit about this during the last
> developers meeting.  I just need to know if the preference is to
> provide a kernel or build it each time.  If we start using more
> pre-builts, probably need a way to version control those and
> streamline submission?

As I see it, these are the steps:
1 - prefer to reuse the pre-built kernel images that already exist whenever
    possible;
2 - if that is not enough, build one, preferably based on an existing
    qemu...defconfig;
3 - when many tests need to build a kernel, check the commonalities between
    them and provide a new pre-built that fits many tests;
4 - back to 1;
And we are currently in step 2, near to go to step 3.
But that is only my opinion, of course.


Concerning new builtin images, if you want to add a new one, I suppose you
could do this:
 - generate the new image and store it in a public temporary url;
 - add the support in the test infra for this new image and use it in at least
   one test case;
 - test your test case by placing the image in the test-dl or your usual
   BR2_DL_DIR folder. It works even on GitLab CI!, see [1];
 - send the patch for review adding a note below "---" with the url for the
   image to be stored in the current artifacts url;


Since you mentioned version control...
Maybe, in the long term, we could create a separate repo, i.e.
buildroot-runtime-tests-binaries in GitHub and accept merges.
I think people in the list would not like to receive patches with 2-5 MB.
A .txt file along each binary stating how the image was generated (i.e. the
sha1 of buildroot and defconfig name, and even the url for a build in GitLab CI)
would be nice IMO.
Just an idea/example.


Two more questions came to mind when thinking about adding more builtin images:

What is the naming to use?
I am happy with the current one: kernel-versatile, and similar.
And when we need to generate a new one for the same arch (actually a machine
that qemu supports) with newer kernel version, the kernel version is a good
suffix IMO.

What kernel config to use?
Should we trim down to have a small image? Should we add stuff to allow maximum
reuse? IMO, using the default kernel intree defconfig selected by our qemu
defconfigs seems a good compromise.
Looking at the images generated at [2]:
versatile = 2.6 MB
vexpress  = 4.1 MB
aarch64   = 6.7 MB
And comparing to the images currently used by the test infra:
versatile = 2.0 MB
vexpress  = 3.3 MB
Those sizes seem acceptable to me.
Notice I did not tested using such images with the test infra.


[1] https://gitlab.com/RicardoMartincoski/buildroot/commit/e226e5a0a1918670fd688cb268176da589ca2fae
[2] https://gitlab.com/buildroot.org/buildroot/pipelines/36081029

Regards,
Ricardo
