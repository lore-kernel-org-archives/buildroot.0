From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 11 Jan 2021 22:18:21 +0100
Subject: [Buildroot] [External] RE: [PATCH 2/3]
 package/environment-setup: make script idempotent
In-Reply-To: <cae9a28ef14f433387e41bf32283c2f6@siemens.com>
References: <20201231212949.2415485-1-konrad.schwarz@siemens.com>
 <20201231212949.2415485-3-konrad.schwarz@siemens.com>
 <CANQCQpZzAiF1AsrJThuH_H+cc3TXRykEMFkEXWkbPczPaN48yQ@mail.gmail.com>
 <8ad435cc3aa244418144fe451e23430f@siemens.com>
 <CANQCQpYkkgdV4Z9Dcry1C53zOt14-LHoZpVpt6qHfSaG1y3M1A@mail.gmail.com>
 <9b8f9336839b4b628858e587242c3926@siemens.com>
 <cbfd493e-16ae-1b2a-0071-4c78d407241d@mind.be>
 <cae9a28ef14f433387e41bf32283c2f6@siemens.com>
Message-ID: <da4e4742-cc6c-b434-fc19-00ad99a5ddcd@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08/01/2021 14:10, Schwarz, Konrad wrote:
> 
> Hi Arnout,
> 
>>>> Could you just grep the PATH to see if the SDK path is present instead of doing a command test?
>>>
>>> 	command -v executable
>>> is _the_ POSIX compliant way of checking if an executable can be found via PATH.  See
>> https://pubs.opengroup.org/onlinepubs/9699919799/utilities/command.html.  Trying to recreate this via grep or other means would
>> seem to be clearly more error prone (and command -v, being a built-in, is faster to boot -- no pun intended). Additionally,
>> environments such as MSYS, where the path separation character is not : (colon) but ; (semicolon), as in MS-DOS, additionally
>> complicate a manual re-implementation of command -v.
>>
>>  What Matt means is that, to avoid adding $SDK_PATH/bin to PATH when it is already there, it is better to do
>>
>> if ! echo "$PATH" | grep -q -E "(^|:)$SDK_PATH/bin($|:)"; then ...
>>
>>  That way, you *exactly* check if it's a double entry or not.
> 
> As noted above, this would fail in MSYS.

 Does the rest van Buildroot work in MSYS? I'd be very surprised since things
already often break on FreeBSD...


>  Similar to my suggestion, this code is not exactly equivalent to the original:
>  there is no guarantee that a cross-compilation toolchain found by PATH search is actually the one in $SDK_PATH/bin.
> (Portable code should use printf %s\\n "$PATH" rather than echo).

 Why? echo seems pretty well specified in POSIX, as long as no special
characters need to be used.


>  All in all, I fail to see substantial benefit of this
> suggestion.

 The problem indicated by Matt is that it is possible that a pre-installed
toolchain can already be found in $PATH. When such a toolchain is used as an
external toolchain, Buildroot will generate a wrapper executable with exactly
the same name as the original toolchain. Concretely: if you define
/usr/local/bin/aarch64-none-linux-gnu-gcc as the pre-installed external
toolchain, Buildroot will create a symlink
output/host/bin/aarch64-none-linux-gnu-gcc that points to the wrapper
executable, and the wrapper looks up aarch64-none-linux-gnu-gcc in /usr/local/bin.

 With this change, if /usr/local/bin is already in $PATH, environment-setup will
not extend PATH with the buildroot wrapper. Thus, if you run
aarch64-none-linux-gnu-gcc, you will not get the arch specification and the
pointer to the sysroot and all the rest that is added by the wrapper - which
essentially makes the toolchain misbehave.

 Although I don't care much about this environment-setup script, I really don't
want to make it completely broken :-)


> You could however use
> 	test "$(command -v ${CROSS_COMPILE}gcc)" = "$SDK_PATH/bin/${CROSS_COMPILE}gcc"
> to be 100% sure.

 That would indeed be a good option.


 Note BTW that I marked the series as Changes Requested, so it won't be applied
unless you repost it.

 Regards,
 Arnout
