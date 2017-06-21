From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 21 Jun 2017 23:44:27 +0200
Subject: [Buildroot] [PATCH 1/4 v2] tools: add a directory to store some
 useful user-facing tools
In-Reply-To: <20170621052152.GA23076@scaer>
References: <20170619154227.GA3045@scaer>
 <5949d4c290853_3c4af6e910447ac@ultri3.mail> <20170621052152.GA23076@scaer>
Message-ID: <46aa3c8c-7085-b024-ea77-d610b8971780@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21-06-17 07:21, Yann E. MORIN wrote:
> Ricardo, All,
> 
> On 2017-06-20 23:06 -0300, Ricardo Martincoski spake thusly:
>> On Mon, Jun 19, 2017 at 12:42 PM, Yann E. MORIN wrote:
>>> On 2017-06-18 22:11 -0300, Ricardo Martincoski spake thusly:
>> [snip]
>>>> BUT if it is called without a .config file, it hangs forever waiting for input,
>>>> and the menuconfig is sent to the log file.
>>>
>>> Indeed, my use-case is to only use it in an already-configured tree.
>>>
>>>> Maybe we can bailout if no .config is present.
>>>
>>> Hmmm... It's not trivial do detect, because the .config file is not
>>> necessarily in the current directory, for example:
>>>
>>>     brmake -C /pat/to/buil-dir
>>>
>>> and I don't want to write a make option interpeter either...
>>
>> Oh, I see now it is not trivial.

 How about instead make the script do

make -C ${0%/*}/.. O=${PWD} "${@}"

if $PWD is not the Buildroot dir. This still allows overriding either option on
the command line.

 Not that this solves the issue...


> Yet I think I was able to do it in a minimalist way that should cover
> 99.999999% of the cases (or so I hope, famous last words):
>     https://git.buildroot.org/~ymorin/git/buildroot/commit/?h=yem/contrib&id=221c72431bb12e0dde4051d9317d9fee2bee6eb2

 I haven't tried, but doesn't it do the wrong thing with

make O=... -C ...

?


 But it still doesn't completely solve the issue, because "brmake menuconfig"
still does the wrong thing... Unfortunately I don't know how to solve that
(other than detecting menuconfig as an argument, obviously).

 On a related note, perhaps it's better to redirect stdin in case there is
something interactive during the build (e.g. Qt license approval).


 Regards,
 Arnout

> I'll resubmit soon (after a bit more testing...)
> 
>> Only on the first use the user can get confused.
>> I think adding a usage example in the file header is enough, saying the script
>> must be run inside or pointing to (-C from make) an output directory already
>> configured, or something like that.
>>
>> [snip]
>>>>> +    a script that can be run instead of make, that prepends the date in
>>>>> +    front of each line, redirects all of the build output to a file
>>>>> +    ("'br.log' in the current directory), and just ouputs the Buildroot
>>>>
>>>> Maybe this file will be dropped as discussed in
>>>> http://patchwork.ozlabs.org/patch/777446/
>>>> If not, there is a typo
>>>>
>>>> ouputs -> outputs
>>>
>>> Yup, I already dropped the file locally.
>> [snip]
>>
>> The purpose of the script (initially in 00-README.txt, with the typo fixed)
>> could be placed in the script header as well.
> 
> Yep, good idea. I'll do that.
> 
> Thanks!
> 
> Regards,
> Yann E. MORIN.
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
