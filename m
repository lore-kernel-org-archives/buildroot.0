From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 21 Aug 2018 09:10:19 +0000
Subject: [Buildroot] [Bug 11251] Util scanpypi failes when package change -
 to _ in tar file (Trunk)
In-Reply-To: <bug-11251-163@https.bugs.busybox.net/>
References: <bug-11251-163@https.bugs.busybox.net/>
Message-ID: <bug-11251-163-641pONon6s@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11251

--- Comment #2 from mzweerspenko+bugzilla at gmail.com ---
Ok. My end goal was to add socketio-client-nexus. I got the error when scanpypi
is resolving dependencies. I tried to keep my bug report as small as possible.

I have made workaround. But python is new to me. 


    def load_setup(self):
        """
        Loads the corresponding setup and store its metadata
        """
        current_dir = os.getcwd()
        self.tmp_extract =
os.path.join(os.path.dirname(self.tmp_extract),self.filename.split(".tar")[0])
        #print("MGZ: {0} {1}".format(self.tmp_extract,extract_dir))
        os.chdir(self.tmp_extract)
        sys.path.append(self.tmp_extract)
        s_file, s_path, s_desc = imp.find_module('setup', [self.tmp_extract])
        setup = imp.load_module('setup', s_file, s_path, s_desc)
        try:
            self.setup_metadata = self.setup_args[self.metadata_name]
        except KeyError:
            # This means setup was not called which most likely mean that it is
            # called through the if __name__ == '__main__' directive.
            # In this case, we can only pray that it is called through a
            # function called main() in setup.py.
            setup.main()  # Will raise AttributeError if not found
            self.setup_metadata = self.setup_args[self.metadata_name]
        # Here we must remove the module the hard way.
        # We must do this because of a very specific case: if a package calls
        # setup from the __main__ but does not come with a 'main()' function,
        # for some reason setup.main() will successfully call the main
        # function of a previous package...
        sys.modules.pop('setup', None)
        del setup
        os.chdir(current_dir)
        sys.path.remove(self.tmp_extract)

-- 
You are receiving this mail because:
You are on the CC list for the bug.
