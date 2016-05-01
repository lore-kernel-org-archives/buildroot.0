From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 1 May 2016 22:11:18 +0200
Subject: [Buildroot] [PATCH] ccache: fix explicit build 'make clean
	host-ccache'
In-Reply-To: <20160501143931.7f767fb8@free-electrons.com>
References: <1461952973-20054-1-git-send-email-patrickdepinguin@gmail.com>
 <20160501143931.7f767fb8@free-electrons.com>
Message-ID: <CAAXf6LWxP-Z-aonTSkjsOn0sGq6zhsB2gYta6K1AQYSK3DwmoQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, May 1, 2016 at 2:39 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Fri, 29 Apr 2016 20:02:53 +0200, Thomas De Schampheleire wrote:
>
>> To build host-ccache we need to call the bare compiler. With a standard
>> 'make', this is guaranteed because host-ccache is built as part of the
>> dependencies, and a target-specific variable sets HOSTCC/HOSTCXX to the
>> no-ccache version (see ).fo
>> However, this is not the case when using 'make host-ccache' explicitly
>> from a clean build.
>
> I think this means that the CC/CXX assignments in
> support/dependencies/dependencies.mk are useless, no? If you do "make
> clean host-tar", or "make clean host-xz" or "make clean host-sstrip",
> it will fail the same way, no? Doesn't this mean that those "special"
> package should be fixed to define CC=$(HOSTCC_NOCCACHE)
> CXX=$(HOSTCXX_NOCCACHE) in their environment ?

After some quick checking, it seems to depend which packages are in
DEPENDENCIES_HOST_PREREQ: 'make clean host-foo' will fail if host-foo
is in DEPENDENCIES_HOST_PREREQ but will succeed if it is not. This is
because packages that all packages get 'dependencies' as dependency,
except packages that are itself in DEPENDENCIES_HOST_PREREQ.

So, on my system, 'make clean host-xz' worked fine because I have a
suitable xzcat already and hence host-xz is not put in
DEPENDENCIES_HOST_PREREQ. Similar for host-tar. If I cheat and add
host-xz in DEPENDENCIES_HOST_PREREQ unconditionally, 'make clean
host-xz' indeed fails.

This difference depending on the host system also means that a
solution where e.g. host-xz is changed to set CC and CXX to
no-ccache-versions is suboptimal: in case host-xz is not in
DEPENDENCIES_HOST_PREREQ, the package would be built without ccache
even if it were available. One could argue that there's no need to
build host-xz in this scenario, but I can imagine other packages that
can be mandatory in some situations and optional in others.
Maybe this is nothing to worry about and we should keep things simple:
don't use ccache for host packages that are potentially a core
dependency for buildroot.

What are your thoughts?

>
>> +# To build host-ccache we need to call the bare compiler. With a standard
>> +# 'make', this is guaranteed because host-ccache is built as part of the
>> +# dependencies, and a target-specific variable sets HOSTCC/HOSTCXX to the
>> +# no-ccache version (see support/dependencies/dependencies.mk).
>> +# However, this is not the case when using 'make host-ccache'.
>> +HOST_CCACHE_CONF_ENV += CC=$(HOSTCC_NOCCACHE) CXX=$(HOSTCXX_NOCCACHE)
>
> Double quotes around the variable value?

Yes, indeed. Need to fix that in any case.

/Thomas
