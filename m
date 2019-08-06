From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Aug 2019 22:21:18 +0200
Subject: [Buildroot] [PATCH 5/6] autobuild-run: initial implementation
 of get_reproducibility_failure_reason()
In-Reply-To: <20190806181251.21885-5-itsatharva@gmail.com>
References: <20190806181251.21885-1-itsatharva@gmail.com>
 <20190806181251.21885-5-itsatharva@gmail.com>
Message-ID: <20190806222118.79871663@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Atharva,

On Tue,  6 Aug 2019 23:42:50 +0530
Atharva Lele <itsatharva@gmail.com> wrote:

> +            if json_data["unified_diff"] == None:
> +                if json_data["details"][0]["source1"] == "file list":
> +                    json_data["details"].pop(0)
> +
> +                for i in range(0, len(json_data["details"])):
> +                    diff_source = json_data["details"][i]["source1"]
> +                    with open(packages_file_list, "r") as packagef:
> +                        for line in packagef:
> +                            if diff_source in line:
> +                                package = line.split(',')[0]
> +
> +                    # Get package version
> +                    package_info = json.loads(subprocess.check_output(["make", "--no-print-directory",
> +                                                                       "O=%s" % self.outputdir,
> +                                                                       "-C", self.srcdir,
> +                                                                       "%s-show-info" % package]))
> +                    if "version" in package_info[package]:
> +                        version = package_info[package]["version"]
> +                        reason = [package, version]
> +                    else:
> +                        reason = [package]
> +                    json_data["details"][i]["package"] = reason
> +                    json_data["details"][i].pop("source2")
> +                    if json_data["details"][i]["unified_diff"] == None:
> +                        json_data["details"][i].pop("unified_diff")
> +                        for j in range(0, len(json_data["details"][i]["details"])):
> +                            delta = json_data["details"][i]["details"][j]["unified_diff"].split("\n")
> +                            deltas = clean_delta(delta)
> +                            json_data["details"][i]["details"][j]["added"] = deltas[0][:100]
> +                            json_data["details"][i]["details"][j]["deleted"] = deltas[1][:100]
> +                            try:
> +                                json_data["details"][i]["details"][j].pop("unified_diff")
> +                                json_data["details"][i]["details"][j].pop("source2")
> +                            except KeyError as e:
> +                                log_write(self.log, "KeyError: %s not found in JSON details[%d][%d]" % (e, i, j))
> +                    else:
> +                        delta = json_data["details"][i]["unified_diff"]
> +                        deltas = clean_delta(delta)
> +                        json_data["details"][i]["added"] = deltas[0][:100]
> +                        json_data["details"][i]["deleted"] = deltas[1][:100]
> +                        try:
> +                            json_data["details"][i].pop("unified_diff")
> +                            json_data["details"][i].pop("source2")
> +                        except KeyError as e:
> +                            log_write(self.log, "KeyError: %s not found in JSON details[%d]" % (e, i))
> +                reason = json_data["details"][0]["package"]

Wow. This is way too complicated, and needs to be split into
sub-functions, and local variables should be used to make this clearer.
Perhaps a few comments in the code would also help.

Also, I believe doing loops with range(0, len(a list)) is not very
pythonic, a more pythonic way is:

	for item in a_list:
		... do something with item ...

But clearly, having sub-functions each doing one part of the job would
help a lot.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
