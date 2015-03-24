From: Lorenzo M. Catucci <lorenzo@sancho.ccd.uniroma2.it>
Date: Tue, 24 Mar 2015 01:03:00 +0100
Subject: [Buildroot] Proposed patch: allow setting an hashed root
	password
In-Reply-To: <20150323184831.GC4214@free.fr>
References: <550EDB2A.9030107@sancho.ccd.uniroma2.it>
 <20150322160022.GC4724@free.fr> <550EEA7E.8000207@mind.be>
 <20150322173132.GA5387@free.fr> <550F3EDE.8090106@ccd.uniroma2.it>
 <20150322225625.GB26325@free.fr>
 <CAJtjsKZU3p5ScRQH2b+pLPLqP6z82BHeWizHu43EAzBR1N-KXA@mail.gmail.com>
 <20150323184831.GC4214@free.fr>
Message-ID: <5510A9B4.70605@sancho.ccd.uniroma2.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've just sent another proposed patch; this time I've put in an explicit
choice to disable root login (that was my original need), and a separate
choice for hashed or cleartext input format.

In my opinion, if the project chooses to handle password setting from a script
instead than from the makefile, the input format should be the same used in
the usermap, even though this would then force to change the semantics of
BR2_TARGET_GENERIC_ROOT_PASSWD...

Thank you very much, yours

	lorenzo

On 23/03/2015 19:48, Yann E. MORIN wrote:
> Johan, All,
> 
> On 2015-03-23 12:05 +0100, Johan Oudinet spake thusly:
>> On Sun, Mar 22, 2015 at 11:56 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>>>
>>> Alternatively, you could also tweak the root password from a post-build
>>> script, see BR2_ROOTFS_POST_BUILD_SCRIPT:
>>>     http://buildroot.net/downloads/manual/manual.html#rootfs-custom
>>>
>>> script which could look something like:
>>>
>>>     #!/bin/sh
>>>     PASSWD='your-encoded-password'
>>>     sed -r -i -e "s/^root:[^:]+:/root:${PASSWD}:/" "${TARGET_DIR}/etc/passwd"
>>>
>>> And in the end, I wonder if that would not be the best option...
>>>
>>
>> This is the solution we do internally. I'm not sure how hard it is for
>> us to send it upstream as it implies several changes. I'll look into
>> it this week.
>> Basically, we have a script to ease the access to BR2_* variables
>> inside post_build scripts, then we have a post_build script that looks
>> to BR2_TARGET_GENERIC_ROOT_PASSWD and:
>> - if it's empty, it does nothing;
>> - if it starts by $1$, $5$, or $6$, it assumes it is already
>> encrypted, and skip the encoding part
>> - otherwise, first it encodes it by calling mkpasswd with the
>> BR2_TARGET_GENERIC_PASSWD_METHOD method, then it replaces the second
>> field of the root user in the /etc/shadow file
> 
> Well, recognising an md5, sha256 or sha512 hashed password from a
> plain-text one is pretty trivial.
> 
> What's not so trivial is recognising:
>   - a DES-encoded password
>   - a disabled password, marked with a leading '!'
>   - a no-login password, marked with just a single '*'
> 
> Detecting a DES-encoded password is not easy because the accepted chars
> are in a sub-set as those accepted for a plain-text password.
> 
> However, maybe we could deprecate DES-encoding altogether, then we
> could handle those cases:
> 
>   - password is '*'                 --> login not allowed; stop
>   - password starts with '!'        --> login disabled, skip the '!'; continue
>   - password starts with ${1,5,6}$  --> treat it as an encoded password; stop
>   - anything else                   --> treat it as a plain-text password
> 
> That way, the existing option can be re-used for all cases, and we would
> not need anything more, just adapting the current code in system/system.mk.
> 
> Thoughts?
> 
> Regards,
> Yann E. MORIN.
> 


-- 
+-------------------------+----------------------------------------------+
| Lorenzo M. Catucci      | Centro di Calcolo e Documentazione           |
| catucci at ccd.uniroma2.it | Universit? degli Studi di Roma "Tor Vergata" |
|                         | Via O. Raimondo 18 ** I-00173 ROMA ** ITALY  |
| Tel. +39 06 7259 2255   | Fax. +39 06 7259 2125                        |
+-------------------------+----------------------------------------------+

-- 
+-------------------------+----------------------------------------------+
| Lorenzo M. Catucci      | Centro di Calcolo e Documentazione           |
| catucci at ccd.uniroma2.it | Universit? degli Studi di Roma "Tor Vergata" |
|                         | Via O. Raimondo 18 ** I-00173 ROMA ** ITALY  |
| Tel. +39 06 7259 2255   | Fax. +39 06 7259 2125                        |
+-------------------------+----------------------------------------------+
