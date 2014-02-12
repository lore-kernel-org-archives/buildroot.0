From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 12 Feb 2014 17:49:21 +0100
Subject: [Buildroot] Build error from time to time
In-Reply-To: <CANxTyt52zqEJk=tbSW7Mc6J369kqRBNUaqSat3q_sAh+2_WecA@mail.gmail.com>
References: <AFACE42542AE499CA9403FAD6805F21A@JohanW7>	<52FB1E5F.1000305@mind.be>
 <CANxTyt52zqEJk=tbSW7Mc6J369kqRBNUaqSat3q_sAh+2_WecA@mail.gmail.com>
Message-ID: <52FBA611.2000402@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/02/14 16:30, Danomi Manchego wrote:
> On Wed, Feb 12, 2014 at 2:10 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>> On 11/02/14 16:23, Sagaert Johan wrote:
>>  Took me a while to find it, but it looks like a parallel build issue in
>> nettle combined with ccache. In the configure step, all the *.d files are
>> created as empty files. These files are included unconditionally in the
>> Makefile, so you get an error if they don't exist. Unfortunately, ccache
>> does an unlink() just before creating the new file, so there is a tiny
>> window of time where the file doesn't exist. It looks like you have a
>> filesystem where this window is relatively large (NFS?), which is why you
>> see the problem and others don't.
>>
>>  This is a tough nut to crack fundamentally.
>>
>> * You could say that nettle's behaviour of including empty dependency
>> files is bad. To overcome that, a - can be added in front of the include.
>>
>> * You can say the behaviour of ccache is bad. The unlink could be removed
>> there, except in the case of CCACHE_HARDLINK because it is not possible
>> to create a hardlink to an existing file.
>>
>>  Any suggestions on how to proceed?
> 
> Would forcing non-parallel build (MAKE1) get around this issue?

 Yes, but that would be a pity since nettle is fairly large.

 Regards,
 Arnout

> Danomi -
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
