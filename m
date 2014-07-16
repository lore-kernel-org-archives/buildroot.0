From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 16 Jul 2014 19:04:10 +0200
Subject: [Buildroot] [PATCH 3/7 v3] package/ncurses: Allow building wide
 char support
In-Reply-To: <53B6DD23.9040605@zacarias.com.ar>
References: <1402982507.184990.682485888591.3.gpush@pablo>
 <53B6DD23.9040605@zacarias.com.ar>
Message-ID: <CAAXf6LWC_CzguzqpnLbAvyHedqVf6chkZhJYELzmfFjhnq0z7g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jeremy, Gustavo,

On Fri, Jul 4, 2014 at 6:58 PM, Gustavo Zacarias
<gustavo@zacarias.com.ar> wrote:
> On 06/17/2014 02:21 AM, Jeremy Kerr wrote:
>
>> Allow ncurses to be configured with wide char support; this causes the
>> libraries to be built with the 'w' suffix (eg libncursesw.so,
>> libmenuw.so, etc), so we need to create a few symlinks.
>>
>> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
>
> Hi.
> I'm testing this patch for bug #6950 goodness.
> In principle what you do seems fine rather than going the split approach
> like it's mentioned in the bug.
> However the patch needs a little tweak:
>
>> +ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
>> +NCURSES_CONF_OPT += --enable-widec
>> +NCURSES_LIB_SUFFIX = w
>> +
>> +define NCURSES_LINK_LIBS
>> +     for lib in $(NCURSES_LIBS-y); do \
>> +             ln -sf $${lib}$(NCURSES_LIB_SUFFIX).so \
>> +                     $(1)/usr/lib/$${lib}.so; \
>> +     done
>> +endef
>
> You're basically not dealing with the static version of the libraries
> here, this breaks at least tmux (it statically links in ncurses), and
> i'm sure many other BR2_PREFER_STATIC_LIB=y scenarios.
>
> A big allyespackageconfig run revealed a couple of packages breaking,
> namely nano and statserial, i've already cooked patches for them and
> send them shortly to the list.
>
> Otherwise it seems all is great.


Could any of you respin and repost the patch with this comment taken
into account?

Thanks a lot,
Thomas
