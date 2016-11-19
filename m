From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 19 Nov 2016 17:50:25 +0100
Subject: [Buildroot] [PATCH 1/1] host-python: Really do not use the
 system OpenSSL.
In-Reply-To: <f01041c6-2cd5-3aee-94b9-b743f9836bd7@mind.be>
References: <43b2e7d1-6366-3d98-89f1-d2ab7ca3db2c@green-communications.fr>
 <20161117150649.5568-1-nicolas.cavallari@green-communications.fr>
 <2c158563-8cb5-f271-68e6-3c173bd2f3b1@mind.be>
 <770975c2-bae0-897c-a798-5fe5df84c016@green-communications.fr>
 <f01041c6-2cd5-3aee-94b9-b743f9836bd7@mind.be>
Message-ID: <cb78d17c-83c2-5da2-61d9-1e8d2e1f1d16@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 19-11-16 17:43, Arnout Vandecappelle wrote:
> 
> 
> On 19-11-16 16:56, Nicolas Cavallari wrote:
>> On 19/11/2016 13:02, Arnout Vandecappelle wrote:
>>>
>>>
>>> On 17-11-16 16:06, Nicolas Cavallari wrote:
>>>> Even if buildroot patches host-python to not compile the 'ssl' module,
>>>> the '_ssl' and '_hashlib' module are still compiled if python detects
>>>> an usable OpenSSL installation.  This may break compilation if the
>>>> system's OpenSSL has been updated to 1.1.0 because of a bug in python,
>>>> see https://bugs.python.org/issue26470 for details.
>>>>
>>>> If python does not detect an usable openssl installation for _hashlib,
>>>> it uses internal implementation of common hash algorithms instead.
>>>>
>>>> This modifies the configure.ac patch to also disable _ssl and _hashlib
>>>> if --disable-ssl is used.
>>>>
>>>> It must also modify setup.py to force enabling the internal
>>>> implementation of hash algorithms if _hashlib is disabled, otherwise, if
>>>> an usable openssl installation is detected, it will not compile
>>>> them and python will end up with no hash algorithm implementation at all,
>>>> breaking host-python-pycrypto and its reverse-dependencies like crda.
>>>>
>>>> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
>>>
>>>  I'm facing this problem as well: host-python doesn't build anymore on my machine.
>>>
>>> Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>>>
>>>
>>>  However, I wonder if this is the right approach. For me, it makes more sense to
>>> fix patch 111 by modifying setup.py in the same patch, so that the entire ssl
>>> detection is skipped if the ssl module is disabled. Something like:
>>
>> I was trying to minimize the amount of lines changed. I assume this
>> patch is not going to be applied upstream.
> 
>  I don't see a reason why not, it adds an enable/disable option to the set they
> already have. Thomas, did you ever try to send it upstream?
> 
>  By the way, any idea why we don't have this for python3? setup.py seems to be
> identical...

 Ah, the same problem _does_ exist for host-python3. Could you patch that one as
well? But perhaps it's better to wait until we come to a conclusion on this one.

 Regards,
 Arnout

> 
> 
>> Reindenting the whole openssl detection code would create a big patch
>> that could easily break with later versions. Not sure if this is wanted.
> 
>  Well, the patch should be upstreamed :-) With this change, there is actually a
> good reason to upstream it, because the ssl detection is broken for
> cross-compilation when system-ssl is installed in /usr/local/ssl, so the
> --disable-ssl configure option is a way to get out of that.
> 
> 
>  Regards,
>  Arnout
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
