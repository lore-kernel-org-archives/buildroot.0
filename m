From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Mon, 27 Jan 2014 22:09:08 +0100
Subject: [Buildroot] [PATCH 1/1] Prefer 'command -v' over 'which' (for
	portability)
In-Reply-To: <CAAXf6LU+oBr5novWFFJc1DOeopzAMb1aLbA5nah--2kQWYi4wA@mail.gmail.com>
References: <1390659116-18865-1-git-send-email-bjorn.forsman@gmail.com>
 <CAHXCMMKE-WDNCTQ82uuEM5n=t4Ua=qTDTTaBxQ7=wVgiBejd0w@mail.gmail.com>
 <CAEYzJUEZMqJS=tOtd8n2dPAnsSm1XW7Fr0VqocboOE5VwGzqgQ@mail.gmail.com>
 <CAAXf6LU+oBr5novWFFJc1DOeopzAMb1aLbA5nah--2kQWYi4wA@mail.gmail.com>
Message-ID: <CAEYzJUEhyggR3+gOc5TnaciNYpOrNwgjkrSapSBwRZu41E0okQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27 January 2014 21:32, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> On Mon, Jan 27, 2014 at 9:01 PM, Bj?rn Forsman <bjorn.forsman@gmail.com> wrote:
>> On 27 January 2014 10:19, Samuel Martin <s.martin49@gmail.com> wrote:
>>> Bj?rn, all,
>>
>> [...]
>>
>>> "command -v" seems not playing very well with aliases:
>>>
>>> $ command -v make
>>> alias make='~/.config/ctafconf/bin/colorwarper make'
>>> $ which make
>>> /usr/bin/make
>>
>> Ah, correct.
>>
>> There is "type -P" which is more like "which" in that regard, but the
>> "-P" option doesn't seem to be specified by POSIX. For example, "type
>> -P which" fails in dash.
>>
>> Instead of an alias, you could write a one-liner shell wrapper? I tend
>> to prefer wrappers over aliases anyway, because of issues like these;
>> aliases sometimes behave differently than proper commands.
>
> Why I also think this is saner than aliases, we cannot dictate this
> principle to all buildroot users, so buildroot cannot rely on aliases
> not being used...

In the example above, "which" finds the /usr/bin/make binary and
ignores the alias. So what do you propose that Buildroot should
support?

The way I see it we have three options:

1) Allow aliases but silently ignore them (current behaviour)
2) Allow aliases and handle them properly (requires some changes)
3) Disallow aliases (and suggest wrappers?)

If we apply this s/which/command -v/ patch I think we can still obtain
the current behaviour by just running "unalias" for each core
dependency.

Best regards,
Bj?rn Forsman
