From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 20 Dec 2013 14:24:40 +0100
Subject: [Buildroot] [PATCH v10 7/8] package: enable jobserver for
	recursive make
In-Reply-To: <52B32C7A.1010008@mind.be>
References: <1387363007-19846-1-git-send-email-fabio.porcedda@gmail.com>
 <1387363007-19846-8-git-send-email-fabio.porcedda@gmail.com>
 <52B32C7A.1010008@mind.be>
Message-ID: <CAHkwnC80BXHiGW5ywYpBHFON_7yK0x3Oyve_ymzoWh8bb1oiUw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Dec 19, 2013 at 6:27 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 18/12/13 11:36, Fabio Porcedda wrote:
>>
>> Add '+' prefix to the $($(PKG)_BUILD_CMDS) and $($(PKG)_INSTALL*_CMDS)
>> commands to enable jobserver for the sub-make.
>>
>> Without the '+' prefix GNU make does not detect the sub-make so it
>> disable the jobserver for the sub-make.
>
>
>  $(PKG)_BUILD_CMDS is a multiline define, and the recursive make call may
> not be the first command. Can you check if this still works if the build
> commands are something like:
>
> define FOO_BUILD_CMDS
>         echo "Hello world!"
>         $(MAKE) -C $(@D)
> endef

The following test seems to work fine:

define test
    echo test
    $($(PKG)_BUILD_CMDS)
endef

# Build
$(BUILD_DIR)/%/.stamp_built::
    @$(call step_start,build)
    @$(call MESSAGE,"Building")
    +$(test)
    ...

Test output:
-----
$ make BR2_JLEVEL= -j$((`getconf _NPROCESSORS_ONLN`+1)) -s wget-build
>>> wget 1.14 Building
test
Making all in lib
Making all in src
Making all in doc
Making all in po
Making all in tests
Making all in util
----

If i remove the '+' charter:
----
$ make BR2_JLEVEL= -j$((`getconf _NPROCESSORS_ONLN`+1)) -s wget-build
>>> wget 1.14 Building
test
make[1]: warning: jobserver unavailable: using -j1.  Add `+' to parent
make rule.
Making all in lib
Making all in src
Making all in doc
Making all in po
Making all in tests
Making all in util
----

Best regards
-- 
Fabio Porcedda
