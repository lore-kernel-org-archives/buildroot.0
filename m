From: Tomas V. Arredondo <surf_fanatico@yahoo.com>
Date: Tue, 18 Aug 2020 02:24:45 +0000 (UTC)
Subject: [Buildroot] updating modules.conf?
In-Reply-To: <1493087963.2947865.1597636258601@mail.yahoo.com>
References: <1493087963.2947865.1597636258601.ref@mail.yahoo.com>
 <1493087963.2947865.1597636258601@mail.yahoo.com>
Message-ID: <1129899854.3545334.1597717485553@mail.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Turns out that the sedoctool.py script is reading the doc/policy.xml and creating the modules.conf. Looking at sedoctool.py:
? ? #modules enabled and disabled values? ? MOD_BASE = "base"? ? MOD_ENABLED = "module"? ? MOD_DISABLED = "off"<...snip...>? ??
? ? def gen_module_conf(doc, file_name, namevalue_list):? ? ? ? ? ? """? ? ? ? ? ? Generates the module configuration file using the XML provided and the? ? ? ? ? ? previous module configuration.? ? ? ? ? ? """? ? ? ? ? ? # If file exists, preserve settings and modify if needed.? ? ? ? ? ? # Otherwise, create it.? ? <...snip...>? ? ? ? ? ? ? ? ? ? ? ? ? ? mod_name = node.getAttribute("name")? ? ? ? ? ? ? ? ? ? ? ? ? ? mod_layer = node.parentNode.getAttribute("name")? ? <...snip...>? ? ? ? ? ? ? ? ? ? ? ? ? ? if mod_name and mod_layer:? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? file_name.write("# Layer: %s\n# Module: %s\n" % (mod_layer,mod_name))? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? if required:? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? file_name.write("# Required in base\n")? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? file_name.write("#\n")? ??? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?if [mod_name, MOD_DISABLED] in namevalue_list:? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? file_name.write("%s = %s\n\n" % (mod_name, MOD_DISABLED))? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? # If the module is set as enabled.? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? elif [mod_name, MOD_ENABLED] in namevalue_list:? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? file_name.write("%s = %s\n\n" % (mod_name, MOD_ENABLED))? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? # If the module is set as base.? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? elif [mod_name, MOD_BASE] in namevalue_list:? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? file_name.write("%s = %s\n\n" % (mod_name, MOD_BASE))
So sedoctool.py has the nice feature of: "# If file exists, preserve settings and modify if needed."?
Hence, modules.conf can just be added whole here via a patch and the modules that are not desired set as "off" here: refpolicy-2.20190609/policy/modules.conf and the script will update as needed based on desired policy.
One more detail is that in the next stage of the refpolicy Makefile (Building) the modules.conf with the updates is deleted in the beginning which kind of clashes with the ability of sedoctool to preserve the patched version of modules.conf...so patched the removal in the Building stage of the Makefile.
[7m>>> refpolicy 2.20190609 Building^[
<...snip...>
rm -f policy/modules.conf
The Makefile in refpolicy-2.20190609 has this line that I patched out because we are patching in our own modules.conf:
bare: clean<...snip...>$(verbose) rm -f $(mod_conf)
That patch looks like:
? ? --- BUILDROOT/Makefile? 2020-08-17 13:25:06.963804709 -0400? ? +++ FIX/Makefile? 2020-08-17 19:25:29.540607763 -0400? ? @@ -636,7 +636,6 @@? ? ? ? ? ? $(verbose) rm -f $(modxml)? ? ? ? ? ? $(verbose) rm -f $(tunxml)? ? ? ? ? ? $(verbose) rm -f $(boolxml)? ? -? ? ? ?$(verbose) rm -f $(mod_conf)? ? ? ? ? ? $(verbose) rm -f $(booleans)? ? ? ? ? ? $(verbose) rm -fR $(htmldir)? ? ? ? ? ? $(verbose) rm -f $(tags)
What do I know but IMO this patch unblocks a nice feature in sedoctool.py :-) as it allows a simple way of just patching the modules.conf like any other patch.
Thanks,
Tomas Arredondo
    On Sunday, August 16, 2020, 11:50:58 PM EDT, Tomas V. Arredondo <surf_fanatico@yahoo.com> wrote:  
 
 Hi,
Really sorry to bother... I have a couple of questions, really appreciate any help...
Basically looking to disable modules and create others in modules.conf.? I don't see an obvious way of doing that as I tried adding my changes to a modules.conf patch but it failed given that the modules.conf file gets built and was not downloaded so it was not available for patching :-(
I did see a patch from 2016 that talked about updating modules.conf but the BR2_ option is not available anymore:?https://lists.buildroot.org/pipermail/buildroot/2016-April/158109.html

"> +REFPOLICY_MODULES_FILE = $(call qstrip,$(BR2_PACKAGE_REFPOLICY_MODULES_FILE))> +define REFPOLICY_CUSTOM_MODULES_CONF> +? ? ? ?cp $(REFPOLICY_MODULES_FILE) $(@D)/policy/modules.conf> +endef> +endif> +> +define REFPOLICY_CONFIGURE_CMDS> +? ? ? ?$(REFPOLICY_GIT_SUBMODULE_SETUP)
Goes away after submodules are supported."? <= submodules?
The other question is about the?S00selinux labelling script mentioned in the above patch, I see that it used semanage which is not available.? I have seen other versions with the fixfiles script (also not available in BR2 selinux I believe).??Does anyone know of any examples anywhere?? Appreciate the time.
Thanks a lot,Tomas Arredondo  
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200818/dfef30ca/attachment.html>
