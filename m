From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 26 May 2021 20:45:36 +0200
Subject: [Buildroot] [PATCH 0/5] [RFC] Introduce cross-bin directory
In-Reply-To: <a18e0834-cec0-5de4-a6c5-48a5f4c94035@mind.be>
References: <20200204142456.1537358-1-arnout@mind.be>
 <a18e0834-cec0-5de4-a6c5-48a5f4c94035@mind.be>
Message-ID: <203dc233-85a2-f9d1-680c-52e7887d7250@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04/02/2020 16:15, Arnout Vandecappelle wrote:
> 
> 
> On 04/02/2020 15:24, Arnout Vandecappelle (Essensium/Mind) wrote:
>> This series is the start of a "cross-bin" directory that I've mentioned
>> a couple of times already.
>>
>> The idea is that host-tools that are meant for cross-building but don't
>> encode the cross-target in their name can be put in this directory, and
>> we put this directory in front of PATH for cross-compilation. For
>> example, the pkg-config wrapper is really a cross-compilation wrapper.
>> To be able to support building of host tools with it, we need to add
>> environment variables to force host compilation in HOST_CONFIGURE_OPTS.
>> By moving the pkg-config wrapper to the cross-bin directory, we can
>> avoid that: for cross-compilation (i.e. target packages), the cross-bin
>> dir is put in front of PATH, so the pkg-config wrapper for target is
>> found. For native compilation (i.e. host packages), the cross-bin dir
>> is *not* put in PATH, so the normal pkg-config configuration will be
>> used.
>>
>> This series does not do that yet for pkg-config itself. It is only done
>> for python and python3. The idea is to start with something a little
>> bit less far-reaching that pkg-config. Also, the python3 change is
>> needed for meson packages that build python modules from C code (e.g.
>> recent python-gobject). These need to have _PYTHON_SYSCONFIGDATA_NAME
>> set in the environment, but we can't just export that unconditionally
>> even for target packages because sometimes (e.g. in libglib2) meson
>> builds native python modules as part of the build and those should
>> *not* have _PYTHON_SYSCONFIGDATA_NAME set to the target name... The
>> python3 wrapper nicely solves this.
>>
>> The python2 wrapper is added as well for symmetry, and because it
>> allows us to simplify the inner-python-package definitions.
>>
>> This series is posted as an RFC, but it can actually be applied as is.
>> It is a requirement for many packages that use the newly-added
>> gobject-introspection (e.g. gstreamer1, python-gobject).

 In the end, it seems this series was not really that important for
gobject-introspection. And it turns out not to work as well as I hoped to begin
with.

 Therefore, I've marked it as Rejected in patchwork.

> 
>  Yann noticed that he has posted something similar/related three years ago:
> 
> http://lists.busybox.net/pipermail/buildroot/2015-December/147891.html

 Maybe another attempt in 2025 then :-)

 Regards,
 Arnout

> 
> 
>  Regards,
>  Arnout
> 
>>
>> Arnout Vandecappelle (5):
>>   package/Makefile.in: add HOST_BIN_CROSS
>>   package/python3: install wrapper in HOST_BIN_CROSS
>>   package/python: install wrapper in HOST_BIN_CROSS
>>   package/pkg-python: rely on python wrapper in HOST_BIN_CROSS
>>   package/pkg-meson: use TARGET_MAKE_ENV in configure
>>
>>  package/Makefile.in               |  5 ++++-
>>  package/pkg-meson.mk              |  2 +-
>>  package/pkg-python.mk             | 22 +++-------------------
>>  package/python/python-wrapper.in  | 10 ++++++++++
>>  package/python/python.mk          | 17 ++++++++++++++---
>>  package/python3/python-wrapper.in | 24 ++++++++++++++++++++++++
>>  package/python3/python3.mk        | 17 ++++++++++++++---
>>  7 files changed, 70 insertions(+), 27 deletions(-)
>>  create mode 100644 package/python/python-wrapper.in
>>  create mode 100644 package/python3/python-wrapper.in
>>
