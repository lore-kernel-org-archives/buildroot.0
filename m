From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 20 Dec 2013 16:47:44 +0100
Subject: [Buildroot] [PATCH v10 7/8] package: enable jobserver for
	recursive make
In-Reply-To: <CAHkwnC80BXHiGW5ywYpBHFON_7yK0x3Oyve_ymzoWh8bb1oiUw@mail.gmail.com>
References: <1387363007-19846-1-git-send-email-fabio.porcedda@gmail.com>
 <1387363007-19846-8-git-send-email-fabio.porcedda@gmail.com>
 <52B32C7A.1010008@mind.be>
 <CAHkwnC80BXHiGW5ywYpBHFON_7yK0x3Oyve_ymzoWh8bb1oiUw@mail.gmail.com>
Message-ID: <52B466A0.8000105@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/12/13 14:24, Fabio Porcedda wrote:
> On Thu, Dec 19, 2013 at 6:27 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>> On 18/12/13 11:36, Fabio Porcedda wrote:
>>>
>>> Add '+' prefix to the $($(PKG)_BUILD_CMDS) and $($(PKG)_INSTALL*_CMDS)
>>> commands to enable jobserver for the sub-make.
>>>
>>> Without the '+' prefix GNU make does not detect the sub-make so it
>>> disable the jobserver for the sub-make.
>>
>>
>>   $(PKG)_BUILD_CMDS is a multiline define, and the recursive make call may
>> not be the first command. Can you check if this still works if the build
>> commands are something like:
>>
>> define FOO_BUILD_CMDS
>>          echo "Hello world!"
>>          $(MAKE) -C $(@D)
>> endef
>
> The following test seems to work fine:

  OK, good!

  Regards,
  Arnout

>
> define test
>      echo test
>      $($(PKG)_BUILD_CMDS)
> endef
>
> # Build
> $(BUILD_DIR)/%/.stamp_built::
>      @$(call step_start,build)
>      @$(call MESSAGE,"Building")
>      +$(test)
>      ...
>
> Test output:
> -----
> $ make BR2_JLEVEL= -j$((`getconf _NPROCESSORS_ONLN`+1)) -s wget-build
>>>> wget 1.14 Building
> test
> Making all in lib
> Making all in src
> Making all in doc
> Making all in po
> Making all in tests
> Making all in util
> ----
>
> If i remove the '+' charter:
> ----
> $ make BR2_JLEVEL= -j$((`getconf _NPROCESSORS_ONLN`+1)) -s wget-build
>>>> wget 1.14 Building
> test
> make[1]: warning: jobserver unavailable: using -j1.  Add `+' to parent
> make rule.
> Making all in lib
> Making all in src
> Making all in doc
> Making all in po
> Making all in tests
> Making all in util
> ----
>
> Best regards
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
