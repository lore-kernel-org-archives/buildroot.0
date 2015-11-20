From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Fri, 20 Nov 2015 09:02:42 -0600
Subject: [Buildroot] [PATCH] openssl: fix race condition when symlink
 shared libs
In-Reply-To: <564EB1B1.805@lysator.liu.se>
References: <1447962631-60866-1-git-send-email-ryan.barnett@rockwellcollins.com>
 <564EB1B1.805@lysator.liu.se>
Message-ID: <CAMQcK5KFosvT-Hrqbzu+Aip_W=b-CChBy6DwfKV70Bn8zHT1RQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Thu, Nov 19, 2015 at 11:37 PM, Peter Rosin <peda@lysator.liu.se> wrote:
>
> On 2015-11-19 20:50, Ryan Barnett wrote:
>
>> +
>> +diff --git a/Makefile.shared b/Makefile.shared
>> +index 8d57163..ce66574 100644
>> +--- a/Makefile.shared
>> ++++ b/Makefile.shared
>> +@@ -118,14 +118,14 @@ SYMLINK_SO=    \
>> +             if [ -n "$$SHLIB_COMPAT" ]; then \
>> +                     for x in $$SHLIB_COMPAT; do \
>> +                             ( $(SET_X); rm -f $$SHLIB$$x$$SHLIB_SUFFIX; \
>> +-                              ln -s $$prev $$SHLIB$$x$$SHLIB_SUFFIX ); \
>> ++                              ln -sf $$prev $$SHLIB$$x$$SHLIB_SUFFIX ); \
>
> I thought the problem was that the two parties raced, not that the symlink couldn't be
> created. Thus, the key part was to replace "rm" with the force flag of ln, so that race
> loser does a no-operation instead of (temporarily) clobbering the state for the race
> winner. So, you apparently only do half the job in this patch...

The errors are as follows:

  ln: failed to create symbolic link 'libssl.so': File exists
  ln: creating symbolic link `libcrypto.so': File exists

ln is failing to create a symbolic link because the link already
exists. As Arnout described, there are two parallel paths that are
calling SYMLINK_SO, so how I understand it is that there a tiny chance
that both parallel paths call the 'rm -f' and then one creates a
symbolic link before the other. I think this still fixes the issue,
however, I think that the 'rm -f' is pointless because the 'ln -sf' is
more or less perform what was intended by the 'rm -f'.

Saying that though, I will remove the 'rm -f' and resend the patch.

Thanks,
-Ryan

-- 
Ryan Barnett / Sr Software Engineer
Airborne Information Systems / Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
ryan.barnett at rockwellcollins.com
www.rockwellcollins.com
