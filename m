From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 5 Sep 2016 23:49:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/opencv3: use
	BR2_TOOLCHAIN_HAS_LIBATOMIC
In-Reply-To: <20160905233917.329b142f@free-electrons.com>
References: <20160905210056.24393-1-bernd.kuhls@t-online.de>
 <20160905233917.329b142f@free-electrons.com>
Message-ID: <CAHXCMM++EYB0VrtR3fsFBZ9aem09tPP3E6unfajt_A4DaVKPWg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Sep 5, 2016 at 11:39 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Mon,  5 Sep 2016 23:00:56 +0200, Bernd Kuhls wrote:
>
>> +# Uses __atomic_fetch_add_4
>> +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
>> +OPENCV3_CONF_OPTS += -DCMAKE_CXX_FLAGS="-latomic"
>> +endif
>
> Isn't this overriding the flags already passed? Shouldn't it be:
>
>         -DCMAKE_CXX_FLAGS="${CMAKE_CXX_FLAGS} -latomic"
>
> or something like that?

Nope, this is correct because, by default, CMAKE_CXX_FLAGS is not set
by Buildroot (except for
host-package), and for the target ones, the toolchainfile.cmake allows
defining package specific
CMAKE_CXX_FLAGS (see [1]).

Besides, doing:
  -DCMAKE_CXX_FLAGS="${CMAKE_CXX_FLAGS} -latomic"
may allow take into account the CMAKE_CXX_FLAGS variable set in the
Buildroot environment; I'm
not sure we want this...

So, the original code from Bernd should behave as expected.

[1] https://github.com/buildroot/buildroot/blob/master/support/misc/toolchainfile.cmake.in#L17

Regards,

-- 
Samuel
