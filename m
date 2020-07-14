From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Tue, 14 Jul 2020 15:31:09 +0200
Subject: [Buildroot] [PATCH] package/scons: explicitly specify host
 Python 3
In-Reply-To: <20200714101510.378d1909@windsurf.home>
References: <20200714033927.1516172-1-hancock@sedsystems.ca>
 <20200714101510.378d1909@windsurf.home>
Message-ID: <17dc14ac-1f7f-ef67-84af-e41241ffe86a@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas, Robert and all,

On 14/07/20 10:15, Thomas Petazzoni wrote:
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

AFAIK, we usually do the opposite:
$(if $(BR2_PACKAGE_PYTHON3),python3,python)

> 
> or if we simply stop doing this and say that we switch to just python3 >
> Titouan, what do you think ?

In my very own opinion, we should now only use host-python3 everywhere, 
unless host-python(2) is strictly required. Pragmatically speaking, in 
the rare cases where host-python(2) is still necessary, having both 
Pythons on the host would not be that much of an overhead (both in terms 
of building time and disk space); and would reduce the clutter in all 
the places where we do the fancy dance you describe above.

On the target side, I'm also looking forward to invert the target 
py2/py3 logic, ie changing

$(if $(BR2_PACKAGE_PYTHON3),python3,python))

into

$(if $(BR2_PACKAGE_PYTHON),python,python3))

especially in package/pkg-python.mk.

Again, the goal is to have Python3 as default, while still allowing old 
Python2-only programs to run where needed. I'll try to find some time 
this week to go through the Buildroot tree and update the Python3 
migration page (https://www.elinux.org/Buildroot:Python2Packages), as 
there has been some change since the FOSDEM dev days. This shall help us 
understand where Python2 is still required.

> 
> Thomas
> 

Titouan
