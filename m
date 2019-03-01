From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 01 Mar 2019 12:38:06 +0100
Subject: [Buildroot] [PATCH 1/1] utils/scanpypi: handle underscores in
 python packages
In-Reply-To: <20190224030136.2009-1-james.hilliard1@gmail.com> (james's
 message of "Sun, 24 Feb 2019 11:01:36 +0800")
References: <20190224030136.2009-1-james.hilliard1@gmail.com>
Message-ID: <87pnrau8o1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "james" == james hilliard1 <james.hilliard1@gmail.com> writes:

 > From: James Hilliard <james.hilliard1@gmail.com>
 > Some python packages seem to use underscores in inconsistent ways, we can
 > attempt to normalize these by always using dashes for the buildroot name
 > and attempting to autodetect the correct metadata name format.

 > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
 > ---
 >  utils/scanpypi | 7 +++++++
 >  1 file changed, 7 insertions(+)

 > diff --git a/utils/scanpypi b/utils/scanpypi
 > index bdce6924b6..55b3d1e61c 100755
 > --- a/utils/scanpypi
 > +++ b/utils/scanpypi
 > @@ -97,6 +97,7 @@ def pkg_buildroot_name(pkg_name):
 >      pkg_name -- String to rename
 >      """
 >      name = re.sub('[^\w-]', '', pkg_name.lower())
 > +    name = name.replace('_', '-')
 >      prefix = 'python-'
 >      pattern = re.compile('^(?!' + prefix + ')(.+?)$')
 >      name = pattern.sub(r'python-\1', name)
 > @@ -299,6 +300,12 @@ class BuildrootPackage():
 >          sys.path.append(self.tmp_extract)
 >          s_file, s_path, s_desc = imp.find_module('setup', [self.tmp_extract])
 >          setup = imp.load_module('setup', s_file, s_path, s_desc)
 > +        if self.metadata_name in self.setup_args:
 > +            pass
 > +        elif self.metadata_name.replace('_', '-') in self.setup_args:
 > +            self.metadata_name = self.metadata_name.replace('_', '-')
 > +        elif self.metadata_name.replace('-', '_') in self.setup_args:
 > +            self.metadata_name = self.metadata_name.replace('-', '_')

I'm not sure we need the first if, but OK.

Committed, thanks.

-- 
Bye, Peter Korsgaard
