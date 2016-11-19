From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Date: Sat, 19 Nov 2016 16:56:14 +0100
Subject: [Buildroot] [PATCH 1/1] host-python: Really do not use the
 system OpenSSL.
In-Reply-To: <2c158563-8cb5-f271-68e6-3c173bd2f3b1@mind.be>
References: <43b2e7d1-6366-3d98-89f1-d2ab7ca3db2c@green-communications.fr>
 <20161117150649.5568-1-nicolas.cavallari@green-communications.fr>
 <2c158563-8cb5-f271-68e6-3c173bd2f3b1@mind.be>
Message-ID: <770975c2-bae0-897c-a798-5fe5df84c016@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/11/2016 13:02, Arnout Vandecappelle wrote:
> 
> 
> On 17-11-16 16:06, Nicolas Cavallari wrote:
>> Even if buildroot patches host-python to not compile the 'ssl' module,
>> the '_ssl' and '_hashlib' module are still compiled if python detects
>> an usable OpenSSL installation.  This may break compilation if the
>> system's OpenSSL has been updated to 1.1.0 because of a bug in python,
>> see https://bugs.python.org/issue26470 for details.
>>
>> If python does not detect an usable openssl installation for _hashlib,
>> it uses internal implementation of common hash algorithms instead.
>>
>> This modifies the configure.ac patch to also disable _ssl and _hashlib
>> if --disable-ssl is used.
>>
>> It must also modify setup.py to force enabling the internal
>> implementation of hash algorithms if _hashlib is disabled, otherwise, if
>> an usable openssl installation is detected, it will not compile
>> them and python will end up with no hash algorithm implementation at all,
>> breaking host-python-pycrypto and its reverse-dependencies like crda.
>>
>> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> 
>  I'm facing this problem as well: host-python doesn't build anymore on my machine.
> 
> Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
> 
>  However, I wonder if this is the right approach. For me, it makes more sense to
> fix patch 111 by modifying setup.py in the same patch, so that the entire ssl
> detection is skipped if the ssl module is disabled. Something like:

I was trying to minimize the amount of lines changed. I assume this
patch is not going to be applied upstream.

Reindenting the whole openssl detection code would create a big patch
that could easily break with later versions. Not sure if this is wanted.
