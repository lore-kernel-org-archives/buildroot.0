From: Joel Stanley <joel@jms.id.au>
Date: Fri, 29 Sep 2017 11:04:48 +1000
Subject: [Buildroot] [PATCH] pdbg: bump version to latest
In-Reply-To: <4755311.maSrUhusWP@new-mexico>
References: <20170927021547.19421-1-joel@jms.id.au>
 <CAKmqyKODhJeyrG3kTXcLjx_NvHKNdmJnzM6k=HkDL1MfrMWO1g@mail.gmail.com>
 <4755311.maSrUhusWP@new-mexico>
Message-ID: <CACPK8XeA296LonSxF8WebncZwdfdZp1_yCT4xDO0hVd-WDiuVA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Sep 29, 2017 at 9:51 AM, Alistair Popple <alistair@popple.id.au> wrote:
> On Thu, 28 Sep 2017 11:18:51 AM Alistair Francis wrote:
>> On Tue, Sep 26, 2017 at 7:15 PM, Joel Stanley <joel@jms.id.au> wrote:
>> > I got this error when attempting to build:
>> >
>> >  aclocal: error: couldn't open directory 'm4': No such file or directory
>>
>> When do you get this error?
>>
>> >
>> > So we now have the post patch hook to ensure the m4 directory is
>> > present.
>>
>> Why is this up to the builder to create this directory? Shouldn't it
>> be created by the packages make system?
>
> I haven't hit this issue myself (although I haven't built the package with
> buildroot and it's a while since I bootstrapped), but it seems reasonable
> to me if it's a problem with the pdbg build process we should just fix it
> there (if there's a patch I've missed let me know).
>
> Any ideas why we only seem to hit this during a buildroot build? Is it just
> something broken on the pdbg side or is it a bit more subtle?

When I do an autoreconf on my Ubuntu system it has a warning, but the
build continues:

$ autoreconf  -i
aclocal: warning: couldn't open directory 'm4': No such file or directory
libtoolize: putting auxiliary files in '.'.
libtoolize: copying file './ltmain.sh'
libtoolize: putting macros in AC_CONFIG_MACRO_DIRS, 'm4'.
libtoolize: copying file 'm4/libtool.m4'
libtoolize: copying file 'm4/ltoptions.m4'
libtoolize: copying file 'm4/ltsugar.m4'
libtoolize: copying file 'm4/ltversion.m4'
libtoolize: copying file 'm4/lt~obsolete.m4'
configure.ac:5: installing './compile'
configure.ac:6: installing './config.guess'
configure.ac:6: installing './config.sub'
configure.ac:2: installing './install-sh'
configure.ac:2: installing './missing'
Makefile.am: installing './depcomp'
$ autoreconf  --version
autoreconf (GNU Autoconf) 2.69

I spent some time searching for a solution, and it wasn't clear who's
fault it was. There are a bunch of packages in buildroot that do a
similar thing:

$ git grep 'mkdir\(.*\)m4' package/
package/atest/atest.mk: mkdir -p $(@D)/m4
package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk:   mkdir -p $(@D)/m4
package/gutenprint/gutenprint.mk:       mkdir -p $(@D)/m4local
package/irqbalance/irqbalance.mk:       mkdir -p $(@D)/m4
package/jamvm/jamvm.mk: mkdir -p $(@D)/m4
package/janus-gateway/janus-gateway.mk: mkdir -p $(@D)/m4
package/lcdapi/lcdapi.mk:       mkdir -p $(@D)/m4
package/libedit/libedit.mk:     mkdir $(@D)/m4
package/libiscsi/libiscsi.mk:   mkdir -p $(@D)/m4
package/libseccomp/libseccomp.mk:       mkdir $(@D)/m4
package/libsoundtouch/libsoundtouch.mk: mkdir -p $(@D)/config/m4
package/ltrace/ltrace.mk:       mkdir -p $(@D)/config/m4
package/openpgm/openpgm.mk:     mkdir -p $(@D)/$(OPENPGM_SUBDIR)/m4
package/sysprof/sysprof.mk:     mkdir -p $(@D)/m4
package/tesseract-ocr/tesseract-ocr.mk: mkdir -p $(@D)/m4

So I copied this method for pdbg.

>> >
>> > In addition, the package now sets a variable with the Git SHA1 so that
>> > the binary contians the expected output for --version.
>>
>> Maybe that should be a separate patch?

I doubt that is useful. If we do it before bumping, it would do
nothing. If we do it afterwards, there will be a commit where the
version is not set.

Cheers,

Joel
