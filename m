From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 22 Dec 2011 11:59:22 +0100
Subject: [Buildroot] tutorial to extend buildroot?
In-Reply-To: <CAOrAeom996AY1PwC=1Ce01qxLOYKZV5wdGd0+Dj6pBq-+X1q-g@mail.gmail.com>
References: <CAOrAeomixni4EZqKWV0p9bVfg9eOsQ+4LP4=CyK6POTsiga2iw@mail.gmail.com>
 <CAAXf6LXrANu2mfxX6zjVGRZYUKH7Ud=wv+Xh7N0p338yxSMHpQ@mail.gmail.com>
 <CAOrAeom996AY1PwC=1Ce01qxLOYKZV5wdGd0+Dj6pBq-+X1q-g@mail.gmail.com>
Message-ID: <CAAXf6LXvhT1+QUskni8-1F=OKvD5omDxCfwLB9SYLbgM5GOXkg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Dec 20, 2011 at 9:08 PM, vbr vbr <vvvg77@gmail.com> wrote:
> Thanks! It seems like "local" is the method I need.
>
> MYPKG_SITE = <top_dir>/extra/libmypkg
> MYPKG_SITE_METHOD = local
>
>
> Let say I have a Makefile in my buildroot-2011.08/extra/libmypkg source
> directory.

Note that the local method does not yet exist in buildroot-2011.08 but
only starting from 2011.11.

> After reading the link you provided, I wasn't sure how buildroot will build
> my code. Is it going to copy the source to the build dir and then invoke
> "make" from there with the right toolchain?
> Or does it expect libmypkg to be based on autotools?

You still have to create a package/libmypkg/libmypkg.mk file as for
normal packages. In that file, you specify the MYPKG_SITE_METHOD
variable, and call the appropriate infrastructure: either gentargets,
autotargets, or cmaketargets.
If your package is not autotools based, no problem, you'd choose
gentargets and you have to provide some build and install commands.
Typically these can be 'make' and 'make install'.
Have a look at the following documentation:
http://buildroot.uclibc.org/buildroot.html#add_packages

The local method will create a copy of your sources from the directory
specified in MYPKG_SITE, using rsync, to the buildroot build
directory.

Best regards,
Thomas

>
>
> On Mon, Dec 19, 2011 at 11:33 PM, Thomas De Schampheleire
> <patrickdepinguin+buildroot@gmail.com> wrote:
>>
>> Hello Vincent,
>>
>> On Tue, Dec 20, 2011 at 2:47 AM, vbr vbr <vvvg77@gmail.com> wrote:
>> > Hi,
>> >
>> > I have set up my buildroot environment, built an external toolchain
>> > (crosstool ng) with uClibc, and I understand how to add autotools-based
>> > packages to buildroot. I committed buildroot source to my svn repo and
>> > most
>> > of the tarballs that I needed which sit in the dl directory. Everything
>> > works great!
>>
>> That's nice to hear!
>>
>> >
>> > Now I have private programs and libraries that I would want to add in
>> > buildroot infrastructure too, but I don't want to add them in the form
>> > of a
>> > tarball like other open-source tools and libraries. I just want to
>> > commit
>> > the source code for each library and integrate their respective
>> > makefiles
>> > (or create a new makefile for each of them to work) with buildroot. (no
>> > tarball involved).
>> >
>> > Does buildroot infrastructure/makefiles support that? Any guidelines or
>> > examples?
>> > I haven't found info regarding that question in the online documentation
>> > so
>> > far.
>>
>> You could either use the git, svn, bzr or hg site methods, or use the
>> 'local' site method.
>> The first set of methods will automatically clone the right revision
>> from your repository and build it. The revision itself is packaged in
>> a tarball in the background, but I don't think this bothers you. It is
>> transparent. All you have to do is specify the revision to use in the
>> .mk file.
>> This is described in the buildroot documentation (search for
>> LIBFOO_SITE_METHOD).
>>
>> The local site method allows you to use an already existing clone or
>> source base. In this case, you point buildroot to the path where this
>> working directory is located. You can have uncommitted files there,
>> which is useful during development. This feature is described in the
>> following blog post made by Thomas Petazzoni:
>> http://free-electrons.com/blog/buildroot-2011-11/
>> It describes some of the new features of buildroot 2011.11 that are
>> not yet documented.
>>
>> Best regards,
>> Thomas
>
>
