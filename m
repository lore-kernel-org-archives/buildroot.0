From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue, 11 Nov 2014 17:55:05 +0100
Subject: [Buildroot] [PATCH v2 02/15] package/pkg-rebar.mk: new
	infrastructure.
In-Reply-To: <20141111153516.GH4240@free.fr>
References: <1415366931-6870-1-git-send-email-johan.oudinet@gmail.com>
 <1415366931-6870-3-git-send-email-johan.oudinet@gmail.com>
 <20141110233154.GG22119@free.fr> <54622372.7000700@mind.be>
 <20141111153516.GH4240@free.fr>
Message-ID: <CAJtjsKYb0HBwAoT4iiLuQWh52quJmYGvpRfx0F4+d3dMkMhVTA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, All,

On Tue, Nov 11, 2014 at 4:35 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>> >> +ifndef $(2)_BUILD_CMDS
>> >> +define $(2)_BUILD_CMDS
>> >> +  cd '$$(@D)' &&                                                  \
>> >> +  if [ -f ./rebar ]; then                                         \
>> >> +          $$($$(PKG)_ENV)                                         \
>> >> +          $$($$(PKG)_REBAR_ENV)                                   \
>> >> +                  ./rebar $$($$(PKG)_REBAR_FLAGS) compile;        \
>> >> +  else                                                            \
>> >> +          $$($$(PKG)_ENV)                                         \
>> >> +          $$($$(PKG)_REBAR_ENV)                                   \
>> >> +                  rebar $$($$(PKG)_REBAR_FLAGS) compile;          \
>> >> +  fi
>> >> +endef
>> >> +endif
>> >
>> > Hmm... Do we want to trust the package's own rebar? Shouldn't we always
>> > use our own version of rebar instead?
>> >
>> > What would be the reason to 'trust' the package's rebar more than our?
>>
>>  Because the package's rebar may be more up-to-date or may be modified. As long
>> as we don't apply cross-compilation patches to our rebar, there is no reason to
>> prefer that one.
>>
>>  Ideally, however, the package should only depend on host-rebar if it will
>> actually use it. It's not a showstopper for me, just a preference.
>
> But as Johan said, some packages' rebar may break the compilation, like
> I could observe in my testing.
>
> Johan, care to investigate why would we use the package's rebar instead
> of our own?

That's because packages distribute a rebar.config{,.script} file and
its syntax may differ from the rebar version packaged in buildroot.
Anyway, if I find out some packages' rebar break the compilation, the
solution is probably to use our own rebar and patch the rebar
configuration file of packages that distribute an old version.

-- 
Johan
