From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Tue, 31 Dec 2013 13:56:45 +0100
Subject: [Buildroot] [PATCH 1/2] Remove some absolute paths
In-Reply-To: <52C1FD9C.9060401@lucaceresoli.net>
References: <1388421102-29198-1-git-send-email-bjorn.forsman@gmail.com>
 <52C1FD9C.9060401@lucaceresoli.net>
Message-ID: <CAEYzJUGnXJ1x-Qcrxd0xy7LLSDLcjie-9=JZwJoV=sR5wWj8kA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 31 December 2013 00:11, Luca Ceresoli <luca@lucaceresoli.net> wrote:
> Il 30/12/2013 17:31, Bj?rn Forsman ha scritto:
>
>> Buildroot fails to run on NixOS because it has no /bin/echo or
>> /bin/grep. Instead of relying on absolute paths, rely on tools to be
>> available in PATH. This should work for all systems.
>>
>> Signed-off-by: Bj?rn Forsman <bjorn.forsman@gmail.com>
>> ---
>>   support/dependencies/dependencies.sh | 96
>> ++++++++++++++++++------------------
>>   1 file changed, 48 insertions(+), 48 deletions(-)
>>
>> diff --git a/support/dependencies/dependencies.sh
>> b/support/dependencies/dependencies.sh
>> index 32b8fea..d1ce918 100755
>> --- a/support/dependencies/dependencies.sh
>> +++ b/support/dependencies/dependencies.sh
>> @@ -7,20 +7,20 @@ export LC_ALL=C
>>   # Verify that grep works
>>   echo "WORKS" | grep "WORKS" >/dev/null 2>&1
>>   if test $? != 0 ; then
>> -       /bin/echo -e "\ngrep doesn't work\n"
>> +       echo -e "\ngrep doesn't work\n"
>
>
> I'm ok with the change, but while we're touching these basig commands,
> why not replacing them with an ECHO and a GREP constant? Such as:
>   ECHO := $(shell which grep)
> or, more simply:
>   ECHO := echo
> and wherever it's used:
>
>  -      /bin/echo -e "\ngrep doesn't work\n"
>  +      $(ECHO) -e "\ngrep doesn't work\n"
>
> This is what we do i.e. for sed. See package/Makefile.in.
>
> This allows successive changes to the command definition without
> the need for a massive search and replace.

I took a quick look in support/dependencies/* and there are
interactions between several makefiles and shell scripts. Should all
deps be defined in variables in support/dependencies/dependencies.mk
and then only be *checked* in support/dependencies/dependencies.sh? Or
should maybe everything, definitions and checking, be moved to
makefiles?

Hm, package/Makefile.in also defines some "dependency" variables:
INSTALL, FLEX, BISON, SED. Looks like dependency handling/checking in
Buildroot could use some refactoring.

"But why not just define local variables in
support/dependencies/dependencies.sh?" My thinking is that as long as
we're

- not using full paths
- not writing setuid tools
- not selecting between similarly named commands, but built for host or target

there is very little benefit from using e.g. ${GREP} instead of grep.
Except that it's more difficult to type :-)

I see that SED is defined as "/path/to/sed -i -e". So mixing
/path/to/tool and tool_options is a way to use such variables. But I
don't think that's a good idea. I'd rather have separate variables,
like SED and SED_OPTS, so that there are no surprises: "oh, SED
changed the source file even though I didn't tell it to". Maybe SED
should be renamed to SED_INLINE? Or SED_WITH_OPTS?

I guess one benefit from using variables for commands is that it makes
the dependencies obvious. As in "if there is no variable defined for
'tool', don't use it", or "if there is no variable defined for 'tool',
define it in the central location and then use it". But that is
difficult to enforce. Just search for 'sed' in buildroot sources and
you'll see :-)

To sum it up, I have mixed feelings about using variables for command
names (that are always in PATH) and I think it is a different issue
than this patch set is trying to solve.

Best regards,
Bj?rn Forsman
