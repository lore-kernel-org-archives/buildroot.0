From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 28 May 2015 09:55:56 -0500
Subject: [Buildroot] [PATCH v4 2015.08 2/4] support/scripts: add
 size-stats script
In-Reply-To: <CALq67GB6scfWxE4F4NZfVFzZHQZ2QAaL9GoE_KsBnmhXvaU0Dg@mail.gmail.com>
References: <1432591007-27689-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1432591007-27689-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <CALq67GB6scfWxE4F4NZfVFzZHQZ2QAaL9GoE_KsBnmhXvaU0Dg@mail.gmail.com>
Message-ID: <CANQCQpZWqZFog2Oa==CLVioNqRvP8A8qf=uC_CpmT=uqw3sv3Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ryan, Thomas,

On Wed, May 27, 2015 at 10:18 PM, Ryan Barnett <ryanbarnett3@gmail.com> wrote:
> Thomas,
>
> On Mon, May 25, 2015 at 4:56 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> This new script uses the data collected by the step_pkg_size
>> instrumentation hook to generate a pie chart of the size contribution
>> of each package to the target root filesystem, and two CSV files with
>> statistics about the package size and file size. To achieve this, it
>> looks at each file in $(TARGET_DIR), and using the
>> packages-file-list.txt information collected by the step_pkg_size
>> hook, it determines to which package the file belongs. It is therefore
>> able to give the size installed by each package.
>>
>> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> ---
>>  support/scripts/size-stats | 238 +++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 238 insertions(+)
>>  create mode 100755 support/scripts/size-stats
>
> Other than a few minor suggestion below, things look good.
>
> Reviewed-by: Ryan Barnett <ryanbarnett3@gmail.com>
> Tested-by: Ryan Barnett <ryanbarnett3@gmail.com>
>
>> diff --git a/support/scripts/size-stats b/support/scripts/size-stats
>> new file mode 100755
>> index 0000000..48a64cd
>> --- /dev/null
>> +++ b/support/scripts/size-stats
>> @@ -0,0 +1,238 @@
>
> [...]
>
>> +#
>> +# This function builds a dictionary that contains the name of a
>> +# package as key, and the size of the files installed by this package
>> +# as the value.
>> +#
>> +# filesdict: dictionary with the name of the files as key, and as
>> +# value a tuple containing the name of the package to which the files
>> +# belongs, and the size of the file. As returned by
>> +# build_package_dict.
>> +#
>> +# builddir: path to the Buildroot output directory
>> +#
>> +def build_package_size(filesdict, builddir):
>> +    pkgsize = collections.defaultdict(int)
>> +
>> +    for root, _, files in os.walk(os.path.join(builddir, "target")):
>> +        for f in files:
>> +            fpath = os.path.join(root, f)
>> +            if os.path.islink(fpath):
>> +                continue
>> +            frelpath = os.path.relpath(fpath, os.path.join(builddir, "target"))
>> +            if not frelpath in filesdict:
>> +                print("WARNING: %s is not part of any package" % frelpath)
>
> Would it be useful to have an exclusion list since this will always be
> printed out?

Or maybe a single warning that has a path to a file where these are appended to?

<snip?



-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber@corp.rockwellcollins.com.
