From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 6 Mar 2017 23:55:43 +0100
Subject: [Buildroot] [PATCH 1/1] boinc: new package
In-Reply-To: <CAPi7W829SyEHhpb9CoSYK+fC1XDuOec-5TcJtwSU71_dSZY_eg@mail.gmail.com>
References: <1488638270-20784-1-git-send-email-fontaine.fabrice@gmail.com>
 <20170304154824.54623667@free-electrons.com>
 <CAPi7W829SyEHhpb9CoSYK+fC1XDuOec-5TcJtwSU71_dSZY_eg@mail.gmail.com>
Message-ID: <CAPi7W81eV4x=RkscE1gaGBamUs+WTonW0ZW0R3iiHFFBNqurHA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

2017-03-04 17:41 GMT+01:00 Fabrice Fontaine <fontaine.fabrice@gmail.com>:

> Dear Thomas,
>
> Thanks for your quick review.
>
> 2017-03-04 15:48 GMT+01:00 Thomas Petazzoni <thomas.petazzoni@free-
> electrons.com>:
>
>> Hello,
>>
>> On Sat,  4 Mar 2017 15:37:50 +0100, Fabrice Fontaine wrote:
>>
>> > + lib_LTLIBRARIES = libboinc_api.la
>> > + libboinc_api_la_SOURCES = $(api_files)
>> > +-libboinc_api_la_LDFLAGS = -L$(libdir) -rpath $(libdir)
>> -version-number $(LIBBOINC_VERSION)
>> > ++libboinc_api_la_LDFLAGS = -rpath $(libdir) -version-number
>> $(LIBBOINC_VERSION)
>>
>> You should also remove the -rpath $(libdir) variable, because the
>> -rpath option also causes the linker to look into $(libdir) during the
>> build process:
>>
>> '-rpath=DIR'
>>      Add a directory to the runtime library search path.  This is used
>>      when linking an ELF executable with shared objects.  All '-rpath'
>>      arguments are concatenated and passed to the runtime linker, which
>>      uses them to locate shared objects at runtime.  The '-rpath' option
>>      is also used when locating shared objects which are needed by
>>      shared objects explicitly included in the link; see the description
>>      of the '-rpath-link' option.  If '-rpath' is not used when linking
>>      an ELF executable, the contents of the environment variable
>>      'LD_RUN_PATH' will be used if it is defined.
>>
>> OK done
>
>> > +BOINC_VERSION = 26198
>> > +BOINC_SITE = $(call github,BOINC,boinc,vboxwrapper/$(BOINC_VERSION))
>>
>> What is this vboxwrapper/<xyz> version?
>>
>> All github releases since July 2016 starts with vboxwrapper. I suppose
> that's becaue the "standard" way of installing boinc is through virtual
> box. vboxwrapper is the name of the boinc package installed inside virtual
> box. This package can contain the client, the server, the manager, ...
>
My assumption was wrong as stated by Christian in
https://github.com/BOINC/boinc/pull/1798. So, the v2 of my patch will
reference client_release tag. I will add a comment to explain that it can
be used to build only the client and the manager and that the server has no
versioning.

> > +BOINC_LICENSE = LGPLv3
>> > +BOINC_LICENSE_FILES = COPYING COPYING.LESSER
>>
>> COPYING contains the text of the GPLv3, so are you sure the entire
>> project is under LGPLv3 ?
>>
> I made a quick search and I found only LGPL in source files, moreover
> README.md, wikipedia and https://boinc.berkeley.edu also mention only
> LGPL. Should I remove COPYING from the list?
>
Concerning the license, the BOINC project confirmed that it is LGPL. From
their understanding, COPYING must be present, see last comment of
https://github.com/BOINC/boinc/pull/1798.

> > +ifeq ($(BR2_PACKAGE_LIBCURL)$(BR2_PACKAGE_OPENSSL),yy)
>> > +BOINC_DEPENDENCIES += \
>> > +     libcurl \
>> > +     openssl
>>
>> One line is enough for this assignment.
>>
> OK done
>
>>
>> Thanks!
>>
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Free Electrons
>> Embedded Linux and Kernel engineering
>> http://free-electrons.com
>>
>
> Best Regards,
>
> Fabrice
>
Best Regards,

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170306/c075a78c/attachment.html>
