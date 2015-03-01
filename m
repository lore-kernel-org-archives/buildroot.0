From: =?UTF-8?Q?Andr=C3=A9_Erdmann?= <dywi@mailerd.de>
Date: Sun, 1 Mar 2015 22:37:09 +0100
Subject: [Buildroot] [PATCH 00/13] autobuild-run: python3 compat and
	misc improvements
In-Reply-To: <CAAXf6LXbRo40L9HZHZKcmHBqMz-KtOXvipQ1GrPd57DhUKzo3Q@mail.gmail.com>
References: <1424899050-24932-1-git-send-email-dywi@mailerd.de>
 <20150226110858.183d31f3@free-electrons.com>
 <EEF2BEA7-3CA2-4250-8E78-E2585246EE66@gmail.com>
 <54F258AD.5040301@mailerd.de>
 <CAAXf6LXbRo40L9HZHZKcmHBqMz-KtOXvipQ1GrPd57DhUKzo3Q@mail.gmail.com>
Message-ID: <CAGrucu3y+dK6ifA86fKfTDPCwqm9tOtv3vaW-NCgSMg-wu6wnQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2015-03-01 22:17 GMT+01:00 Thomas De Schampheleire <patrickdepinguin@gmail.com>:
> Hi Andr?,
>
> On Sun, Mar 1, 2015 at 1:09 AM, Andr? Erdmann <dywi@mailerd.de> wrote:
>> 2015/2/28 Thomas De Schampheleire <patrickdepinguin@gmail.com>:
>>> On February 26, 2015 11:08:58 AM CET, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
>>>> Dear Andr? Erdmann,
>>>>
>>>> On Wed, 25 Feb 2015 22:17:17 +0100, Andr? Erdmann wrote:
>>>>> Patches 1-4 make autobuild-run compatible with both python >=2.6 and
>>>> 3.
>>>>>
>>>>> Patches 5-9 are minor enhancements (mostly cleanup).
>>>>>
>>>>> Patches 10- are more invasive:
>>>>> * move the check_requirements() logic to the SystemInfo class
>>>>> * control environment(->locale), std{in,out,err} of all called
>>>> commands
>>>>
>>>> Thanks a lot all those patches. Overall they look very useful!
>>>>
>>>> I really need to spend some time to merge the patches proposed by
>>>> Thomas DS, and then your patches. I would still like to give the
>>>> priority to Thomas DS patches, since they have been in the queue for a
>>>> very long time.
>>>>
>>>
>>> Andr?,
>>>
>>> Could you give your personal feedback on the usage of docopt in my patches? Do
>>>  you think it is an improvement or rather an unnecessary dependency?
>>>
>>> ThomasP has a different opinion than me, and there haven't been many other
>>>  opinions so far. Your input is this most definitely welcome, no matter which side
>>>  you choose.
>>>
>>
>>
>> The advantage of docopt is that it's really simple and you always have the
>> usage message in the script, but I'd prefer argparse primarily because it's a built-in
>> module (in py >= 2.7). It also features arg validation (via type=<function|type>).
>> There's much more like subparsers, call a <function> each time an <arg> is encountered
>> and whatnot, but that's not of interest here.
>>
>> The major improvement of the docopt approach is reading the config (argv/file)
>> into a few dicts that can be easily merged rather than doing a 3-way merge manually
>> (defaults as locals X ini file parser X argparser namedtuple-like object). That's a
>> good idea. It's doable with argparse as well, "vars(parser.parse_args())" returns
>> the parsed args as dict.
>>
>> So, the ((untested)) prototype of a "dict-improved" config_get() argparse variant would be:
>>
>>
>> [...]
>>
>
> Thanks a lot for your feedback.
>
> Maybe it's because I haven't seen the full solution yet, but this
> handling seems much more involved than the docopt approach. In
> particular it's odd that there would need to be explicit handling of
> things like nonempty or positive_int, which isn't necessary with
> standard argparse nor docopt.

They're purely optional - I've just put them in there to demonstrate
how the input can be restricted so that "--ninstances hello" would get
rejected by the parser (which docopt would not). You could also set
"type=int" instead of "type=positive_int", which is shorter code-wise,
but slighlty less correct.


> I'm biased, of course, but this does not look more desirable to me
> than having an extra docopt dependency.
>
> Best regards,
> Thomas

-- 
Andr?
