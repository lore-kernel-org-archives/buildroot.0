From: Robert Hancock <hancock@sedsystems.ca>
Date: Tue, 14 Jul 2020 10:23:43 -0600
Subject: [Buildroot] [PATCH] package/scons: explicitly specify host
 Python 3
In-Reply-To: <20200714101510.378d1909@windsurf.home>
References: <20200714033927.1516172-1-hancock@sedsystems.ca>
 <20200714101510.378d1909@windsurf.home>
Message-ID: <fcb7c8aa-4265-c6dc-813f-94712df112e2@sedsystems.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2020-07-14 2:15 a.m., Thomas Petazzoni wrote:
> On Mon, 13 Jul 2020 21:39:27 -0600
> Robert Hancock <hancock@sedsystems.ca> wrote:
> 
>> All packages using scons are now using Python 3 to run it, so
>> explicitly set scons as using host-python3. This avoids a
>> spurious host Python 2 dependency if BR2_PACKAGE_PYTHON3 is not
>> set (for example, if no Python is packaged for the target).
>>
>> Signed-off-by: Robert Hancock <hancock@sedsystems.ca>
>> ---
>>   package/scons/scons.mk | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/package/scons/scons.mk b/package/scons/scons.mk
>> index da2ccceb08..a95fa7fd69 100644
>> --- a/package/scons/scons.mk
>> +++ b/package/scons/scons.mk
>> @@ -10,6 +10,8 @@ SCONS_LICENSE = MIT
>>   SCONS_LICENSE_FILES = LICENSE.txt
>>   SCONS_SETUP_TYPE = distutils
>>   
>> +HOST_SCONS_NEEDS_HOST_PYTHON = python3
> 
> I am just wondering if we should do our usual dance that consists in
> relying on python2 if enabled, i.e something like this:
> 
> HOST_SCONS_NEEDS_HOST_PYTHON = $(if ($(BR2_PACKAGE_PYTHON),python,python3)
> 
> or if we simply stop doing this and say that we switch to just python3.

What you describe is basically the existing default behavior in 
package/pkg-python.mk when *_NEEDS_HOST_PYTHON is not set, except that 
the default is reversed, it defaults to python unless 
BR2_PACKAGE_PYTHON3 is set. The problem with that is it conflates what 
is selected for the target with what is needed on the host. In our 
configuration, no Python is selected for the target, so a dependency on 
host-python gets added, even though all of the packages using SCons 
explicitly depend on host-python3 and run SCons using python3, so the 
host-python dependency is pointless.

I went with this simple change in the SCons case, as because it doesn't 
seem widely used (only 3 packages in Buildroot now), the chance that 
another package will end up being added that both uses SCons and can't 
use Python 3 to run it, seems quite unlikely.

> 
> Titouan, what do you think ?
> 
> Thomas
> 

-- 
Robert Hancock
Senior Hardware Designer
SED Systems, a division of Calian Ltd.
Email: hancock at sedsystems.ca
