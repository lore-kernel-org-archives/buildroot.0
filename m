From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sun, 18 Aug 2013 15:15:53 +0200
Subject: [Buildroot] [PATCH] infra: display current task as title of the
 term window
In-Reply-To: <5209C5D1.7040904@mind.be>
References: <1375822004-22591-1-git-send-email-francois.perrad@gadz.org>
 <CAAXf6LWCBh-W3nHRLtoXVy8PfbS3NpOQ7sMwicp6W+kv-OeAkg@mail.gmail.com>
 <5209C5D1.7040904@mind.be>
Message-ID: <CAB0FRstJ-91QOTMsNrGCv7vq=9a_eb5QFXZ+vHm2nL51XkJ7fw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/8/13 Arnout Vandecappelle <arnout@mind.be>:
> On 07/08/13 08:44, Thomas De Schampheleire wrote:
>>
>> Hi Fran?ois,
>>
>> On Tue, Aug 6, 2013 at 10:46 PM, Francois Perrad <fperrad@gmail.com>
>> wrote:
>>>
>>> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>>> ---
>>>   package/pkg-utils.mk |    3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
>>> index 15db096..8572cb1 100644
>>> --- a/package/pkg-utils.mk
>>> +++ b/package/pkg-utils.mk
>>> @@ -64,7 +64,8 @@ INFLATE.xz   = $(XZCAT)
>>>   INFLATE.tar  = cat
>>>
>>>   # MESSAGE Macro -- display a message in bold type
>>> -MESSAGE     = echo "$(TERM_BOLD)>>> $($(PKG)_NAME) $($(PKG)_VERSION)
>>> $(1)$(TERM_RESET)"
>>> +MESSAGE     = echo "$(TERM_BOLD)>>> $($(PKG)_NAME) $($(PKG)_VERSION)
>>> $(1)$(TERM_RESET)" && \
>>> +              echo -e "\033]2;$($(PKG)_NAME) $($(PKG)_VERSION) $(1)\007"
>>>   TERM_BOLD  := $(shell tput smso)
>>>   TERM_RESET := $(shell tput rmso)
>>
>>
>> Although I like the idea, it does not work for me. I'm running Linux
>> Mint, with a Konsole terminal. The above does nothing at all. I also
>> tried manually:
>>
>> echo -ne "\033]0;something\007"
>>
>> but it doesn't change a thing.
>> It does work in gnome-terminal. I haven't tested in other situations.
>>
>> Could you have a look at Konsole?
>>
>> I know that Gentoo has this feature for its portage package
>> installation/compilation tool. When you run 'emerge', the titles are
>> constantly updated with the package that is being handled, also in
>> Konsole. You may be able to find out what the 'right way' is based on
>> their sources.
>
>
>  Are you sure this works for you with emerge? I RTFM'ed it and according to
> the konsole manual, you have to add '%w' to the tab title string to get the
> string set by the shell. Perhaps Gentoo simply sets the default tab title
> string to something including %w.
>

I found the same tip for Konsole, see
http://stackoverflow.com/questions/5373253/how-can-one-put-the-output-of-a-command-into-a-konsole-title-bar
So, the patch must work everywhere `echo $TERM` returns 'xterm'.

Fran?ois

Note : minor improvement in the patch, replace `echo -e` by `echo -ne`

>  Regards,
>  Arnout
>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
