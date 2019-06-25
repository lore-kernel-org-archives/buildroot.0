From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 25 Jun 2019 10:08:49 +0200
Subject: [Buildroot] [PATCH 08/19] autobuild-run: move toolchains_csv
 from kwargs to Builder class
In-Reply-To: <CABM+sgpa27E=+=CYey6DWoQNGwo7N9LueahAri7mAusxNgs44A@mail.gmail.com>
References: <20190621084730.16411-1-itsatharva@gmail.com>
 <20190621084730.16411-8-itsatharva@gmail.com>
 <dc6b2bcd-5353-51d5-e027-d6c7ae76174b@mind.be>
 <CABM+sgpa27E=+=CYey6DWoQNGwo7N9LueahAri7mAusxNgs44A@mail.gmail.com>
Message-ID: <54c669ea-d586-6345-11b9-5f2a6d5cf1a7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25/06/2019 07:01, Atharva Lele wrote:
> On Tue, Jun 25, 2019 at 3:07 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>> On 21/06/2019 10:47, Atharva Lele wrote:
>>> Signed-off-by: Atharva Lele <itsatharva@gmail.com>
>>> ---
>>>  scripts/autobuild-run | 8 ++++----
>>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>> -        toolchains_csv = kwargs['toolchains_csv']
>>> +        toolchains_csv = self.toolchains_csv
>>
>>  Creating a local variable here is not very useful anymore. Better use
>> self.toolchains_csv everywhere below.
>>
>>  That can be done in the same patch.
>>
>>  Either way:
>>
>> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>>
>> In other words: you can respin with self.toolchains_csv everywhere, or Thomas
>> can apply without it. Either way is fine.
>>
>>  Regards,
>>  Arnout
> 
> I tried replacing toolchains_csv with self.toolchains_csv everywhere.
> However it presented a weird issue where after the first build was
> over, it would not be able to find toolchains_csv. It would then go
> into instance-0/buildroot/instance-0/buildroot.. and so on for every
> time it was unable to find toolchains_csv. I'll try it later again
> today and contact on IRC if i come across the same error.

 Ah, of course:

        toolchains_csv = self.toolchains_csv
        if toolchains_csv:
            if not os.path.isabs(toolchains_csv):
                toolchains_csv = os.path.join(self.srcdir, toolchains_csv)


If self.srcdir is not an absolute path, this will keep on appending over and
over again.

 The easiest solution is to move the appending of srcdir to __init__.

 Regards,
 Arnout
