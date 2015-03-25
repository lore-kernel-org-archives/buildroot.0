From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Mar 2015 19:47:53 +0100
Subject: [Buildroot] [PATCH v8] package/sysdig: New package
In-Reply-To: <CAMQcK5+519qW9bQRgMw1MxdFk4Xu7Ap-NRTtr5aqmHChOkGraQ@mail.gmail.com>
References: <1427280821-2909-1-git-send-email-angelo.compagnucci@gmail.com>
 <CAMQcK5KooYkSGu9CZ78Z871DALorZK7GsYv39XAjnK=kLa7O1w@mail.gmail.com>
 <CAMQcK5+519qW9bQRgMw1MxdFk4Xu7Ap-NRTtr5aqmHChOkGraQ@mail.gmail.com>
Message-ID: <20150325194753.3cf82e93@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ryan Barnett,

On Wed, 25 Mar 2015 13:29:56 -0500, Ryan Barnett wrote:

> In your previous email you gave a link to saying why luajit is required:
> 
> [1] http://www.sysdig.org/wiki/how-to-install-sysdig-from-the-source-code/
> 
> However, from reading the documentation it says that you can use the
> bundled luajit. Quoting from the site you provided:
> 
> ---
> By default the bundled version of LuaJIT will be built and linked
> statically. If you prefer to use the system one, then you can do:
> 
> cmake -DUSE_BUNDLED_LUAJIT=OFF ..
> ---
> 
> This would imply that we can make an optional dependency on luajit by
> doing something like this:
> 
> ifeq ($(BR2_PACKAGE_LUAJIT),y)
> SYSDIG_CONF_OPTS += DUSE_BUNDLED_LUAJIT=OFF
> SYSDIG_DEPENDENCIES += luajit
> endif
> 
> I don't think it make sense to have an else case here since it doesn't
> mention having to define BUNDLED_LUAJIT as on.
> 
> It appears that you can the same for zlib and jsoncpp as well. I have
> not tried this yet but from reading the documentation it appears that
> this all possible.

Well, it depends. If those dependencies are indeed mandatory (i.e
sysdig always needs LuaJIT, be it a bundled version or a
system-provided version), I believe we generally prefer to always use
the system-generated version. Using bundling version is not really nice
to make sure that the latest versions of LuaJit/zlib/jsoncpp are used.

So, in general, I think we prefer to use system-provided versions,
unless using the bundled version is absolutely necessary (tight version
dependency, specific hacks done, etc.).

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
