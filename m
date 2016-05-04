From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 4 May 2016 13:03:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/ca-certificates: use host-python
In-Reply-To: <CAFGQKxdUfAbMr7d-7E5dTnzYHDr7dpqht35AiQdD8tj2SdgBEQ@mail.gmail.com>
References: <1462275976-31982-1-git-send-email-martin@barkynet.com>
 <e0b19e0d-0dfd-9ac8-0891-114cdd416eae@mind.be>
 <CAFGQKxdUfAbMr7d-7E5dTnzYHDr7dpqht35AiQdD8tj2SdgBEQ@mail.gmail.com>
Message-ID: <4ab05cea-b99f-4336-855c-1a2241510760@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05/04/16 12:06, Martin Bark wrote:
> Arnout,
>
> On 3 May 2016 at 18:28, Arnout Vandecappelle <arnout@mind.be> wrote:
>> On 05/03/16 13:46, Martin Bark wrote:
>>>
>>> The ca-certificates Makefile directly calls python and hence does not
>>> pickup the buildroot host-python.
>>
>>
>>  Not entirely accurate, I think (didn't check with the autobuild failure
>> output, but this is my guess based on the source). I think it does use
>> host-python because that comes first in the path. However, at that point,
>> host-python is symlinked to python3 instead of python2.
>
> No it's not using python3, certdata2pem.py worked fine with python3
> when i tested.  That was my first thought too but as you can see in
> the error below it's using python 2.6 off the host.
>
> Traceback (most recent call last):
>   File "certdata2pem.py", line 152, in <module>
>     encoded = base64.b64encode(obj['CKA_VALUE']).decode('utf-8')
>   File "/usr/lib/python2.6/base64.py", line 53, in b64encode
>     encoded = binascii.b2a_base64(s)[:-1]
> TypeError: b2a_base64() argument 1 must be string or read-only buffer,
> not bytearray
>
>
> you're right it should be picking up the host-python from PATH but
> it's clearly not.  I had a deeper look and I now i understand the
> issue more.  The steps are as follows:
>
>  - you need to select python3
>  - when host-python builds it detects python3 is going to be installed
> to the target so does not setup a symlink to
> $(HOST_DIR)/usr/bin/python
>  - ca-certificates builds and but no $(HOST_DIR)/usr/bin/python exists
> so it uses the hosts own python version
>  - since the auto build server has python 2.6 installed the script
> uses this and fails.
>  - To see this error ca-certificates needs to be built before a
> package that depends on host-python3 because if
> $(HOST_DIR)/usr/bin/python points to python3 then certdata2pem.py will
> work fine.
>
> So the fix is using $(HOST_DIR)/usr/bin/python2 and not relying on
> $(HOST_DIR)/usr/bin/python existing.  Since you can't rely on
> $(HOST_DIR)/usr/bin/python existing or being a particular version of
> python I'm wondering why is it even be created?

  Actually, if it works with python3 as well, then we shouldn't be building 
python2 just for this package when we already build python3 anyway. So we need 
something like this:

ifeq ($(BR2_PACKAGE_PYTHON3),y)
CA_CERTIFICATES_DEPENDENCIES += host-python3
else
CA_CERTIFICATES_DEPENDENCIES += host-python
endif

  Obviously with a big explanatory comment :-)


  BTW, forget about the Rev-by I gave, it will have changed too much to keep it 
valid.

  Regards,
  Arnout


>
> I'll update my comments and resubmit
>
>>
>>>
>>> During the build all the Makefile does is execute mozilla/certdata2pem.py.
>>> Simplify the build process by directly calling this script using
>>> host-python.
>>
>>
>>  While you're at it, you could also add a comment to the code why
>> host-python is needed (i.e. why system python is not OK). I couldn't find a
>> reference to that in the logs. Something like:
>>
>> # certdata2pem.py needs python2.7 - not python2.6, not python3. So system
>> # can't be used.
>
> Yes that's a good idea, I'll add that comment it needs at least
> python2.7 and resubmit.
>
> Thanks
>
> Martin

[snip]

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
