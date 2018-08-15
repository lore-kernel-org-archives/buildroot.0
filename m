From: Mirza Krak <mirza.krak@northern.tech>
Date: Wed, 15 Aug 2018 14:23:57 +0200
Subject: [Buildroot] [PATCH 4/8] package/mender: add
 BR2_PACKAGE_MENDER_ARTIFACT_NAME option
In-Reply-To: <20180815135330.2fa7ad72@windsurf>
References: <20180814231337.19114-1-mirza.krak@northern.tech>
 <20180814231337.19114-5-mirza.krak@northern.tech>
 <20180815135330.2fa7ad72@windsurf>
Message-ID: <CADHdJwATYL5VguXjETMF8aF81OnQCV2qhj3DmR3F7ODGx8NDTw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 15, 2018 at 1:53 PM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Hello,
>
> On Wed, 15 Aug 2018 01:13:33 +0200, Mirza Krak wrote:
>
>> +if BR2_PACKAGE_MENDER
>> +
>> +config BR2_PACKAGE_MENDER_ARTIFACT_NAME
>> +     string "Mender artifact name"
>> +     help
>> +       The name of the image or update that will be built. This is what the
>> +       device will report that it is running, and different updates must have
>> +       different names.
>> +
>> +       Will be stored in /etc/mender/artifact_info
>> +
>> +endif
>
> I am wondering if we really need a new option for that, or if you
> shouldn't just let the user add /etc/mender/artifact_info to its root
> filesystem overlay.

This file is required to be present for the Mender client to start in
daemon mode, but I could just create a file with "dummy" content
without the option to satisfy that behavior and let users override
with file-system overlay if that is the preferred to minimize number
of options.

Though there is a reason why this was an option and it was to be able
to share this information with the mender-artifact tool, I do not know
if that is actually possible with how I did this. To provide some more
context, somewhere I have the intention of calling the mender-artifact
(host tool) tool with the following arguments:

#Create Mender artifact
mender-artifact write rootfs-image \
    --update ${output_dir}/rootfs.ext4 \
    --output-path ${mender_artifact} \
    --artifact-name ${artifact_name} \
    --device-type ${device_type}

I have not yet figured out where to put above but I am getting there
:). Mender artifacts are basically the ext4 image + some meta-data
(checksum, signature, file-size etc)

Target image and Mender artifact share information (device_type and
artifact_info/artifact_name) to be able to do sanity checks later on
when updates are applied. This was my intention of keeping
artifact_name as an option to be able to share it. But I gladly accept
suggestions on how to best solve this.

-- 
Mirza Krak | Embedded Solutions Architect | https://mender.io

 Northern.tech AS | @northerntechHQ
