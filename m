From: Wolfgang Grandegger <wg@grandegger.com>
Date: Sun, 12 Nov 2017 20:35:39 +0100
Subject: [Buildroot] Bug in RPATH fixing logic
In-Reply-To: <19a7801a-d83b-168b-24cc-8e058c6bb677@grandegger.com>
References: <20171112174013.25d90333@windsurf.home>
 <20171112174955.18449728@windsurf.home> <87y3nbs9jz.fsf@dell.be.48ers.dk>
 <20171112182403.5d5c8fe4@windsurf.home> <87tvxzs7b0.fsf@dell.be.48ers.dk>
 <19a7801a-d83b-168b-24cc-8e058c6bb677@grandegger.com>
Message-ID: <fff0f582-a78a-5aa9-03ee-f04c4c3ddefa@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Am 12.11.2017 um 20:04 schrieb Wolfgang Grandegger:
> Am 12.11.2017 um 19:03 schrieb Peter Korsgaard:
>>>>>>> "Thomas" == Thomas Petazzoni 
>>>>>>> <thomas.petazzoni@free-electrons.com> writes:
>>
>> ? > Hello,
>> ? > On Sun, 12 Nov 2017 18:15:12 +0100, Peter Korsgaard wrote:
>>
>> ? >> > So this happens because the ARC binutils version is fetched 
>> from Git,
>> ? >> > so we need to have host-flex installed, and binutils detects 
>> the flex
>> ? >> > library and decides to use it.
>> ? >>
>> ? >> And there is no configure flag to disable that?
>>
>> ? > Not that I can see.
>>
>> Ok.
>>
>> ? >> Is there a way to get binutils to use soft links instead of hard 
>> links?
>>
>> ? > How would this solve the problem?
>>
>> Well, the problem is that the binary gets processed twice in different
>> directories because of the hard link, so if it instead was a softlink it
>> woud get ignored by the RPATH logic and only get fixed up once - Right?
> 
> Yes, soft links are ignored (only find -type f). $ORIGIN will not work 
> with hard-linked binary files in different levels of the file hierarchy. 

Well, adding a proper $ORIGIN/... for each link to the RPATH would work 
but detecting if other hard links exist is a bit tricky and would take 
time. If the references count (number of hardlinks to a particular 
inode) is greater than 1, we could process them in a special way. Not 
sure if it's worth the effort.

Wolfgang.
