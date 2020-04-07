From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Apr 2020 18:55:19 +0200
Subject: [Buildroot] [PATCH v1 2/2] package/python-flask: fix runtime
 python modules dependencies
In-Reply-To: <20200322211002.30765-2-ps.report@gmx.net> (Peter Seiderer's
 message of "Sun, 22 Mar 2020 22:10:02 +0100")
References: <20200322211002.30765-1-ps.report@gmx.net>
 <20200322211002.30765-2-ps.report@gmx.net>
Message-ID: <87h7xvp760.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > - add python setuptools runtime dependency, fixes:
 >   ModuleNotFoundError: No module named 'pkg_resources'

Hmm, the only instance of pkg_resources I see is in src/flask/cli.py:

    def _load_plugin_commands(self):
        if self._loaded_plugin_commands:
            return
        try:
            import pkg_resources
        except ImportError:
            self._loaded_plugin_commands = True
            return

        for ep in pkg_resources.iter_entry_points("flask.commands"):
            self.add_command(ep.load(), ep.name)
        self._loaded_plugin_commands = True

Which seems to nicely deal with missing pkg_resources.


 > - add python libxml2 runtime dependency, fixes:
 >   ModuleNotFoundError: No module named 'xml'

The python-lxml package provides a 'lxml' module, NOT a 'xml' one. I
don't see an 'import xml' line anywhere, where did you see that error?


 > - add python ssl runtime dependency, fixes:
 >   AttributeError: 'NoneType' object has no attribute 'SSLContext'

This again seems to only be referenced in src/flask/cli.py if you pass a
--key option. Presumably it works without SSL if you don't use --key
/ --cert on flask run?

-- 
Bye, Peter Korsgaard
