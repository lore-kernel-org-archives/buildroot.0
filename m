From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Mon, 18 May 2015 09:14:54 -0500
Subject: [Buildroot] [PATCH v5 09/24] busybox: selinux support
In-Reply-To: <CAHXCMM+9VKZ=i_=QZtLGjA3P=kuFbJDQhBiom10_80ahKjk1ZQ@mail.gmail.com>
References: <1431553177-7280-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1431553177-7280-10-git-send-email-clayton.shotwell@rockwellcollins.com>
 <CAHXCMM+9VKZ=i_=QZtLGjA3P=kuFbJDQhBiom10_80ahKjk1ZQ@mail.gmail.com>
Message-ID: <CANn-YGQn8EmFxguMC_0+5037zXTaRFHCYL5JL5FumaTEar7myg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel,

On Fri, May 15, 2015 at 1:22 AM, Samuel Martin <s.martin49@gmail.com> wrote:
> Hi Clayton,
>
> On Wed, May 13, 2015 at 11:39 PM, Clayton Shotwell
> <clayton.shotwell@rockwellcollins.com> wrote:
>> From: Matt Weber <matthew.weber@rockwellcollins.com>
>>
>> Add a configure option to enable the SELinux support in the
>> busybox configuration from the Buildroot menuconfig.
>>
>> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
>> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
>>
> [...]
>> diff --git a/package/busybox/Config.in b/package/busybox/Config.in
>> index 275e317..a60c54b 100644
>> --- a/package/busybox/Config.in
>> +++ b/package/busybox/Config.in
>> @@ -35,6 +35,12 @@ comment "Busybox individual binaries depends on dynamic libraries"
>>         depends on BR2_STATIC_LIBS
>>         depends on BR2_bfin
>>
>> +config BR2_PACKAGE_BUSYBOX_SELINUX
>> +       select BR2_PACKAGE_LIBSELINUX
>> +       depends on BR2_TOOLCHAIN_HAS_THREADS
>> +       depends on !BR2_STATIC_LIBS
>> +       bool "Enable SELinux support"
> Does not this option also need to select
> BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES?

Those features are not necessarily dependent, it mostly depends on
what parts of busybox are being used. For instance, if a configuration
only used a couple of minor busybox features, such as simple command
line utilities, the symlinked version of busybox could be used to save
space. If busybox was providing more features, such as crond, then
individual binaries would have to be enabled for the SELinux type
transitions to occur properly. I would like to leave that up to the
individual user to enable the individual binaries as needed.

Thanks,
Clayton
